import 'package:cdt_client/presentation/menu/widgets/menu_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hmi_core/hmi_core_translate.dart';
import 'package:hmi_networking/hmi_networking.dart';
///
/// Builds menu page using current user.
/// Users is needed to use specific
/// information about this particular user.
class MenuPage extends StatelessWidget {
  final AppUserStacked users;
  ///
  /// Builds menu page using current user.
  ///
  /// [users] - list of all stored users
  const MenuPage({
    super.key,
    required this.users,
  });
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Authentication'.loc),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
      ),
      body: MenuBody(
        users: users,
      ),
    );
  }
}
