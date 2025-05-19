import 'package:cdt_client/presentation/auth/sign_in/widgets/user_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';

///
/// TODO
class SignInWidget extends StatelessWidget {
  final log = Log('$SignInWidget')..level = LogLevel.info;
  final UserLogin userLogin;
  final void Function(UserLogin userLogin)? onCompleted;
  ///
  /// TODO
  SignInWidget({
    super.key,
    required this.userLogin,
    this.onCompleted,
  });
  //
  @override
  Widget build(BuildContext context) {
    log.debug('[_SignInFormState._buildSignInWidget]');
    final padding = const Setting('padding').toDouble;
    final blockPadding = padding;
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: Padding(
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
                          const Localized('Crane monitoring').v,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        SizedBox(height: padding),
                        Text(
                          const Localized('Welcome').v,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          const Localized('Please authenticate to continue...').v,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: padding),
                        UserLoginWidget(
                          // autofocus: true,
                          userLogin: userLogin,
                          onCompleted: (userLogin) {
                            onCompleted?.call(userLogin);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(flex: 1, child: SizedBox.shrink(),),
          ],
        ),
      ),
    );
  }
}