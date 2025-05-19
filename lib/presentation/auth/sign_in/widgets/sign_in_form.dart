import 'package:cdt_client/presentation/auth/register_user/register_user_page.dart';
import 'package:cdt_client/presentation/auth/sign_in/user_pass_page.dart';
import 'package:cdt_client/presentation/auth/sign_in/widgets/sign_in_widget.dart';
import 'package:cdt_client/presentation/core/widgets/in_pogress_overlay.dart';
import 'package:cdt_client/presentation/menu/menu_page.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_networking/hmi_networking.dart';
import 'package:flutter/material.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_widgets/hmi_widgets.dart';

///
/// TODO...
class SignInForm extends StatefulWidget {
  final Authenticate auth;
  ///
  /// TODO...
  const SignInForm({
    super.key,
    required this.auth,
  });
  //
  @override
  // ignore: no_logic_in_create_state
  State<SignInForm> createState() => _SignInFormState();
}
//
class _SignInFormState extends State<SignInForm> {
  static final _log = Log('$_SignInFormState');
  late UserLogin _userLogin = const UserLogin(value: '');
  bool _isLoading = true;
  //
  @override
  void initState() {
    _isLoading = true;
    widget.auth
      .authenticateIfStored()
      .then((authResult) {
        if (authResult.authenticated) {
          _setAuthState(authResult, true);
        }
        setState(() => _isLoading = false);
      });
    super.initState();
  }
  //
  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      _log.debug('[.build] _isLoading!!!');
      return InProgressOverlay(
        isSaving: true,
        message: const Localized('Loading...').v,
      );
    } else {
      return SignInWidget(
        userLogin: _userLogin,
        onCompleted: (userLogin) {
          _userLogin = userLogin;
          _tryFindUser(userLogin);          
        },
      );
    }
  }
  ///
  // Widget _buildSignInWidget(BuildContext context) {
  // }
  /// ищем пользователя в базе по логину / номеру телефона
  void _tryFindUser(UserLogin userLogin) {
    _log.debug('[._tryFindUser] userLogin: ${userLogin.value()}');
    setState(() => _isLoading = true);
    widget.auth.fetchByLogin(userLogin.value())
      .then((authResult) {
        final user = widget.auth.getUser();
        _log.debug('[._tryFindUser] userInfo: ${user.info?.asMap()}');
        setState(() => _isLoading = false);
        _log.debug('[._tryFindUser] authenticated: ${authResult.authenticated}');
        if (authResult.authenticated) {
          _log.debug('[._tryFindUser] user exists: ${user.exists()}');
          if (user.exists()) {
            // вход после проверки по смс-коду или паролю
            if (user.info?.groups.contains(UserGroupList.guest) ?? false) {
              _setAuthState(authResult, true);
            } else {
              _showUserPassPage(_userLogin, user);
            }
          } else {
            // регистрация нового пользователя
            // _tryRegister(_userLogin);
            _showFlushBar(
              '${authResult.message}\n\n${const Localized('User not found')}.\n',
            );
          }
        } else {
          _showFlushBar(
            authResult.message,
          );
        }
      });
  }
  ///
  void _showUserPassPage(UserLogin userlogin, AppUserSingle user) {
    Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (context) => UserPassPage(
          auth: widget.auth,
          userLogin: userlogin,
        ),
        settings: const RouteSettings(name: "/userPassPage"),
      ),
    ).then((authenticated) {
      _log.debug('[._showUserIdPage] userExists: $authenticated');
      if (authenticated is bool && authenticated) {
        _setAuthState(
          AuthResult(
            authenticated: authenticated, 
            message: const Localized('Authenticated successfully').v, 
            user: user,
          ), 
          authenticated,
        );
      } else {
        _log.debug('[._showUserIdPage] пользователь не прошел проверку');
        setState(() {
          _userLogin = userlogin;
          _isLoading = false;
        });
      }
    });    
  }
  ///
  void _tryRegister(UserLogin userLogin) {
    _log.debug('[._tryRegister] userLogin: $userLogin');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>  RegisterUserPage(
          userLogin: userLogin,
        ),
        settings: const RouteSettings(name: "/registerUserPage"),
      ),
    ).then((isRegistered) {
      if (isRegistered is bool && isRegistered) {
        _tryAuth(userLogin.value(), true);
      }
    });
  }
  ///
  void _tryAuth(String userLogin, bool userExists) {
    _log.debug('[._tryFindUser] _tryAuth: $userLogin,  userExists: $userExists');
    setState(() => _isLoading = true);
    widget.auth
      .authenticateByLoginAndPass(userLogin, widget.auth.getUser().info?.password ?? '')
      .then((authResult) {
        _setAuthState(authResult, userExists);
      });
  }
  ///
  Future<void> _setAuthState(AuthResult authResult, bool userExists) async {
    if (authResult.authenticated) {
      _log.debug('[._setAuthState] Authenticated');
      setState(() => _isLoading = false);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>  MenuPage(
            users: AppUserStacked(appUser: widget.auth.getUser()),
          ),
          settings: const RouteSettings(name: "/menuPage"),
        ),
      ).then((_) {
        setState(() => _isLoading = true);
        widget.auth.logout().then((authResult) {
          setState(() => _isLoading = false);
        });
      });
    } else {
      _log.debug('[._setAuthState] Not authenticated');
      setState(() => _isLoading = false);
      if (userExists) {
        if (!mounted) return;
        _tryRegister(_userLogin);
      }
      if (authResult.message != '') {
        _showFlushBar(authResult.message);
      }
    }
  }
  ///
  void _showFlushBar(String message) {
    BottomMessage.error(
      displayDuration: Duration(milliseconds: const Setting('flushBarDurationMedium').toInt,),
      message: message,
    ).show(context);
  }
  //
  @override
  void dispose() {
    super.dispose();
  }
}
