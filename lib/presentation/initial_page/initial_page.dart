import 'package:cdt_client/infrostructure/bc/sgoc_init_.dart';
import 'package:cdt_client/presentation/initial_page/widgets/initial_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hmi_core/hmi_core_translate.dart';
import 'package:hmi_networking/hmi_networking.dart';

class InitialPage extends StatefulWidget {
  final AppUserStacked users;
  final SgocInit values;
  ///
  const InitialPage({
    super.key,
    required this.users,
    required this.values,
  });

  //
  @override
  State<InitialPage> createState() => _InitialPageState();
}

///
class _InitialPageState extends State<InitialPage> {
  //
  @override
  void initState() {
    super.initState();
  }
  //
  @override
  void dispose() {
    super.dispose();
  }
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Initialization'.loc),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
        ),
      body: InitialBody(users: widget.users),
    );
  }
}
  