import 'package:cdt_client/presentation/result_page/widgets/result_body.dart';
import 'package:flutter/material.dart';
import 'package:hmi_core/hmi_core_translate.dart';
import 'package:hmi_networking/hmi_networking.dart';
///
/// Page for result params(after calculations).
class ResultPage extends StatefulWidget {
  final AppUserStacked users;
  //final SgocInit values;
  /// 
  /// Builds page for result params of the crane.
  /// 
  /// [values] - result params. 
  const ResultPage({
    super.key,
    required this.users,
    //required this.values,
  });
  //
  @override
  State<ResultPage> createState() => _ResultPageState();
}
//
class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Result'.loc, style: Theme.of(context).textTheme.headlineLarge),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ResultBody(),
    );
  }
}
  