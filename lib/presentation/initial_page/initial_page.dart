import 'package:flutter/material.dart';
import 'package:hmi_core/hmi_core_translate.dart';
import 'package:hmi_networking/hmi_networking.dart';
import 'package:cdt_client/presentation/core/widgets/pages_switch/form_page.dart';
import 'package:cdt_client/presentation/initial_page/widgets/initial_body/initial_body.dart';
///
/// Page for initialization params of the crane.
/// Builds page on the base of list of users 
/// and current data of the crane. 
class InitialPage extends StatefulWidget {
  final AppUserStacked users;
  final Pages form;
  //final SgocInit values;
  final Function(bool isValid)? onValidationChanged;
  /// 
  /// Builds page for initialization params of the crane.
  /// 
  /// [users] - list of all stored users
  /// [form] - current form
  /// [data] - temprorary example of InitialPage content
  /// [values] - parametrs for initialization 
  /// [onValidationChanged] - callback for checking is form valid 
  const InitialPage({
    super.key,
    required this.users,
    required this.form,
    //required this.values,
    required this.onValidationChanged,
  });
  //
  @override
  State<InitialPage> createState() => _InitialPageState();
}
//
class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Initialization'.loc, style: Theme.of(context).textTheme.headlineLarge),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: InitialBody(
        users: widget.users,
        form: widget.form,
        onValidationChanged: (isValid) {
          widget.onValidationChanged?.call(isValid);
        },
      ),
    );
  }
}
  