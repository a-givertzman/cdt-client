import 'package:cdt_client/presentation/home_page/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hmi_core/hmi_core_translate.dart';
import 'package:hmi_networking/hmi_networking.dart';

///
/// The home page of the application
class HomePage extends StatelessWidget {
  final AppUserStacked users;
  ///
  /// TODO...
  const HomePage({
    super.key,
    required this.users,
  });
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'.loc),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
      ),
      body: HomeBody(
        users: users,
      ),
    );
  }
}