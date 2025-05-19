import 'package:flutter/material.dart';
import 'package:hmi_networking/hmi_networking.dart';

///
/// The body widget of the [HomePage]
class HomeBody extends StatefulWidget {
  final AppUserStacked users;
  ///
  /// TODO...
  const HomeBody({
    super.key,
    required this.users,
  });
  //
  @override
  State<HomeBody> createState() => _HomeBodyState();
}
//
class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('HomePage to be implemented'),
    );
  }
}