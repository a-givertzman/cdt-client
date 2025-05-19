import 'package:cdt_client/presentation/auth/register_user/widgets/register_user_form.dart';
import 'package:flutter/material.dart';
import 'package:hmi_core/hmi_core.dart';

///
class RegisterUserPage extends StatelessWidget {
  final UserLogin userLogin;
  ///
  const RegisterUserPage({
    super.key,
    required this.userLogin,
  });
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(const Localized('Signing up').v),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ),
      body: Center(
        child: RegisterUserForm(
          userLogin: userLogin,
        ),
      ),
    );
  }
}
