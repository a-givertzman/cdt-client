import 'package:flutter/material.dart';
///
/// Page structure for [PagesSwitch].
class PageConfig {
  final String id;
  final WidgetBuilder builder;
  ///
  /// Page structure for [PagesSwitch].
  /// 
  /// - [id] - page id.
  /// - [builder] - page content.
  const PageConfig({
    required this.id,
    required this.builder,
  });
  //
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageConfig && runtimeType == other.runtimeType && id == other.id;
  //
  @override
  int get hashCode => id.hashCode;
}
