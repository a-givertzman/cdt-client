import 'package:cdt_client/presentation/auth/sign_in/widgets/sign_in_form.dart';
import 'package:flutter/services.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_networking/hmi_networking.dart';
import 'package:flutter/material.dart';

///
class SignInPage extends StatelessWidget {
  final Authenticate auth;
  ///
  const SignInPage({
    super.key,
    required this.auth,
  });
  //
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(const Localized('Authentication').v),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ),
        body: Center(
          child: SignInForm(
            auth: auth,
          ),
        ),
      ),
    );
  }
}
