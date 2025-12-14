import 'package:flutter/material.dart';
///
/// Page structure for [PagesSwitch].
class PageConfig {
  final String name;
  final WidgetBuilder builder;
  ///
  /// Page structure for [PagesSwitch].
  /// 
  /// - [name] - page name.
  /// - [builder] - page content.
  const PageConfig({
    required this.name,
    required this.builder,
  });
}
