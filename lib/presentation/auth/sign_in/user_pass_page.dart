import 'package:cdt_client/domain/core/timers/count_timer.dart';
import 'package:flutter/material.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_networking/hmi_networking.dart';
import 'package:hmi_widgets/hmi_widgets.dart';

/// Класс проверяет пользователя по паролю
class UserPassPage extends StatefulWidget {
  final UserLogin _userLogin;
  final Authenticate _auth;
  ///
  const UserPassPage({
    Key? key,
    required UserLogin userLogin,
    required Authenticate auth,
  }) :
    _userLogin = userLogin,
    _auth = auth,
    super(key: key);
  UserLogin get userLogin => _userLogin;
  //
  @override
  // ignore: no_logic_in_create_state
  State<UserPassPage> createState() => _UserPassPageState(
    auth: _auth,
    userLogin: _userLogin,
  );
}
///
class _UserPassPageState extends State<UserPassPage> {
  static const _log = Log('_UserPassPageState');
  final Authenticate _auth;
  final UserLogin _userLogin;
  // bool _isLoading = false;
  bool _allowResend = true;
  int _secondsLeft = 0;
  int _resendTimeout = 1;
  double _resendTimeoutRaw = 1;
  late UserPassword _userPass;
  late CountTimer _countTimer;
  ///
  _UserPassPageState({
    required UserLogin userLogin,
    required Authenticate auth,
  }) :
    _auth = auth,
    _userLogin = userLogin;
  //
  @override
  void initState() {
    _userPass = UserPassword(value: '');
    _countTimer = CountTimer(
      count: _resendTimeout,
      onTick:(int secondsLeft) {
        if (mounted) {
          setState(() {
            _secondsLeft = secondsLeft;
          });
        }
      },
      onComplete: () {
        _onResendAllowed();
      },
    );
    super.initState();
  }
  //
  @override
  void dispose() {
    _countTimer.cancel();
    super.dispose();
  }
  //
  @override
  Widget build(BuildContext context) {
    final padding = const Setting('padding').toDouble;
    final blockPadding = padding;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(const Localized('Authentication').v),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(blockPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(flex: 1, child: SizedBox.shrink()),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          const Localized('').v,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SizedBox(height: padding),
                        Text(
                          _userLogin.value(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),                  
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          const Localized('Please enter your password').v,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: padding),
                        RepaintBoundary(
                          child: TextFormField(
                            obscureText: true,
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLength: _userPass.maxLength,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                // color: appThemeData.colorScheme.onPrimary,
                              ),
                              errorStyle: TextStyle(
                                height: 1.1,
                              ),
                              errorMaxLines: 5,
                            ),
                            autofocus: true,
                            autocorrect: false,
                            onChanged: (value) {
                              setState(() {
                                _userPass = UserPassword(value: value);
                              });
                            },
                          ),
                        ),
                        SizedBox(height: padding),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: _allowResend
                              ? () {_verifyUserPass(context, _auth, _userLogin, _userPass);}
                              : null,
                            child: _allowResend
                              ? Text(const Localized('Next').v)
                              : Text('${const Localized('Next')} ($_secondsLeft)'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // if(_isLoading) ...[
                  //   SizedBox(height: paddingValue,),
                  //   const LinearProgressIndicator(),
                  // ],
                ],
              ),
            ),
            const Expanded(flex: 1, child: SizedBox.shrink(),),
          ],
        ),
      ),
    );
  }
  ///
  void _verifyUserPass(BuildContext context,  Authenticate auth, UserLogin userLogin, UserPassword userPass) {
    auth.authenticateByLoginAndPass(userLogin.value(), userPass.value(), store: true)
      .then((authResult) {
        if (authResult.authenticated) {
          _updateResendTimeout(reset: true);
          Navigator.of(context).pop(true);
        } else {
          _updateResendTimeout();
          BottomMessage.error(
            displayDuration: Duration(milliseconds: const Setting('flushBarDurationMedium').toInt,),
            message: const Localized('Wrong password').v,
          ).show(context);
        }
      });
  }
  ///
  void _updateResendTimeout({bool? reset}) {
    _countTimer.cancel();
    if (reset is bool && reset) {
      _resendTimeoutRaw = 1;
    } else {
      _resendTimeoutRaw = _resendTimeoutRaw > 120
        ? 1
        : _resendTimeoutRaw * _resendTimeoutRaw * 1.14;
    }
    _resendTimeout = _resendTimeoutRaw.round();
    _log.debug('[_updateResendTimeout] _resendTimeout: $_resendTimeout');
    _countTimer.run(count: _resendTimeout);
    setState(() {
      _allowResend = _resendTimeout <= 1;
      _secondsLeft = _resendTimeout;
    });
  }
  ///
  void _onResendAllowed() {
    setState(() {
      _allowResend = true;
    });
  }
}
