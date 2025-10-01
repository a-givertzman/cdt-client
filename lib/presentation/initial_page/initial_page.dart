import 'package:flutter/material.dart';
import 'package:hmi_core/hmi_core_translate.dart';
import 'package:hmi_networking/hmi_networking.dart';
import 'package:cdt_client/presentation/initial_page/widgets/initial_body/initial_body.dart';
///
/// Page for initialization params of the crane.
/// Builds page on the base of list of users 
/// and current data of the crane. 
class InitialPage extends StatefulWidget {
  final AppUserStacked users;
  //final SgocInit values;
  /// 
  /// Builds page for initialization params of the crane.
  /// 
  /// [values] - parameters for initialization 
  const InitialPage({
    super.key,
    required this.users,
    //required this.values,
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
      body: InitialBody(),
    );
  }
}
  