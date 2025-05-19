import 'package:cdt_client/domain/auth/register_user.dart';
import 'package:cdt_client/presentation/core/widgets/in_pogress_overlay.dart';
import 'package:flutter/material.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_networking/hmi_networking.dart';
import 'package:hmi_widgets/hmi_widgets.dart';

///
/// TODO
class RegisterUserForm extends StatefulWidget {
  final UserLogin userLogin;
  ///
  /// TODO
  const RegisterUserForm({
    super.key,
    required this.userLogin,
  });
  //
  @override
  State<RegisterUserForm> createState() => _RegisterUserFormState();
}
//
class _RegisterUserFormState extends State<RegisterUserForm> {
  static const _log = Log('_RegisterUserFormState');
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String _userName = '';
  final _userLocation = '';
  late UserPassword _userPassword;
  //
  @override
  void initState() {
    if (mounted) {
      const length = 4; // будет сгенерирован пароль в формате xxxx-xxxx
      _userPassword = UserPassword.generate(length, length);
    }
    _log.debug('[.initState] generated userPassword: ${_userPassword.value()}');
    super.initState();
  }
  //
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: const Stream.empty(),
      // stream: user.authStream,
      builder:(context, auth) {
        if (_isLoading) {
          _log.debug('[.build] _isLoading !!!');
          return InProgressOverlay(
            isSaving: true,
            message: const Localized('Loading...').v,
          );
        } else {
          return _buildSignInWidget(context, auth);
        }
      },
    );
  }
  ///
  Widget _buildSignInWidget(BuildContext context, AsyncSnapshot<Object?> auth) {
    _log.debug('[.build] _buildSignInWidget');
    const paddingValue = 13.0;
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: ListView(
        padding: const EdgeInsets.all(paddingValue * 2),
        children: [
          const SizedBox(height: 34.0),
          Text(
            'Ваши данные',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: paddingValue),
          _buildFullNameFormField(context),
          const SizedBox(height: paddingValue),
          _buildPassFormField(context),
          const SizedBox(height: paddingValue),
          ElevatedButton(
            onPressed: isFormValid()
              ? _registerUser
              : null,
            child: Text(const Localized('Next').v),
          ),
        ],
      ),
    );
  }
  ///
  TextFormField _buildPassFormField(BuildContext context) {
    return TextFormField(
          style: Theme.of(context).textTheme.bodyMedium,
          maxLength: _userPassword.maxLength,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.lock,
              // color: Theme.of(context).colorScheme.onPrimary,
            ),
            labelText: 'Пароль',
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            errorStyle: const TextStyle(
              height: 1.1,
            ),
            errorMaxLines: 5,
          ),
          autocorrect: false,
          initialValue: _userPassword.value(),
          validator: (value) => _userPassword.validate().message(),
          onChanged: (value) {
            setState(() {
              _userPassword = UserPassword(value: value);
            });
          },
        );
  }
  ///
  TextFormField _buildFullNameFormField(BuildContext context) {
    return TextFormField(
          style: Theme.of(context).textTheme.bodyMedium,
          maxLength: 50,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.account_box,
              // color: appThemeData.colorScheme.onPrimary,
            ),
            labelText: 'ФИО',
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            errorMaxLines: 3,
          ),
          autocorrect: false,
          validator: (value) => value is String && value.length >= 5 
            ? null
            : 'Не менее 5 символов',
          onChanged: (value) {
            setState(() {
              _userName = value;
            });
          },
        );
  }
  ///
  bool isFormValid() {
    final formKeyCurrentState = _formKey.currentState;
    bool formValid = false;
    if (formKeyCurrentState != null) {
      formValid = formKeyCurrentState.validate();
    }
    return formValid;
  }
  ///
  void _registerUser() {
    setState(() {
      _isLoading = true;
    });
    RegisterUser(
      remote: DataSource.dataSet<Map<String, dynamic>>('set_client'),
      group: UserGroupList.operator,
      location: _userLocation,
      name: _userName,
      phone: widget.userLogin.value(),
      pass: _userPassword.encrypted(),
    )
      .fetch()
      .then((response) {
        if(!response.hasError) {
          Navigator.of(context).pop(true);
          BottomMessage.confirmation(
            displayDuration: Duration(milliseconds: const Setting('flushBarDurationMedium').toInt,),
            message: 'Вы зарегистрированы, сохраните ваш логин и пароль.',
          ).show(context);
        } else {
          BottomMessage.error(
            displayDuration: Duration(milliseconds: const Setting('flushBarDurationMedium').toInt,),
            message: response.errorMessage,
          ).show(context);
        }
      });
  }
}
