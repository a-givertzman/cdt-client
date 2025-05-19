import 'package:flutter/material.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';

///
class UserLoginWidget extends StatefulWidget {
  final UserLogin? userLogin;
  final void Function(UserLogin userLogin)? onCompleted;
  final bool autofocus;
  ///
  const UserLoginWidget({
    Key? key,
    this.userLogin,
    this.onCompleted,
    this.autofocus = false,
  }) : super(key: key);
  //
  @override
  State<UserLoginWidget> createState() => _UserLoginWidgetState();
}

///
class _UserLoginWidgetState extends State<UserLoginWidget> {
  static const _log = Log('_UserLoginWidgetState');
  late UserLogin _userLogin;
  //
  @override
  void initState() {
    if (mounted) {
      final widgetUserLogin = widget.userLogin;
      if (widgetUserLogin != null) {
        _userLogin = widgetUserLogin;
      } else {
        _userLogin = const UserLogin(value: '');
      }
    }
    _log.debug('[.initState] userLogin: ${_userLogin.value()}');
    super.initState();
  }
  //
  @override
  Widget build(BuildContext context) {
    _log.debug('[_UserLoginWidgetState.build] userLogin: ${_userLogin.value()}');
    final blockPadding = const Setting('blockPadding').toDouble;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RepaintBoundary(
          child: TextFormField(
            style: Theme.of(context).textTheme.bodyMedium,
            keyboardType: TextInputType.number,
            maxLength: 254,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.account_circle,
              ),
              prefixStyle: Theme.of(context).textTheme.bodyMedium,
              labelText: const Localized('Your login').v,
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              errorMaxLines: 3,
            ),
            autofocus: widget.autofocus,
            autocorrect: false,
            initialValue: _userLogin.value(),
            validator: (value) => _userLogin.validate(
              message: const Localized('Login must be..').v,
            ).message(),
            onChanged: (phone) {
              setState(() {
                _userLogin = UserLogin(value: phone);
              });
            },
          ),
        ),
        SizedBox(height: blockPadding),
        SizedBox(
          // width: double.infinity,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: _userLogin.validate(
              message: const Localized('Login must be..').v,
            ).valid()
              ? _onComplete
              : null,
            child: Text(const Localized('Next').v),
          ),
        ),
      ],
    );
  }
  ///
  void _onComplete() {
    FocusScope.of(context).unfocus();
    final widgetOnCompleted = widget.onCompleted;
    if (widgetOnCompleted != null) {
      widgetOnCompleted(_userLogin);
    }
  }
}
