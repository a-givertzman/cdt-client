import 'package:flutter/material.dart';
///
/// Implementation of navigation button on the menu page
class MenuNavigationButton extends StatelessWidget {
  final String caption;
  final PageRoute Function()? routeBuilder;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  /// 
  /// Requires all parametrs to build button
  /// that menu uses for navigation to other pages
  /// 
  /// [caption] - text on menu button (name of the page thats button leads to)
  /// [routeBuilder] - route to a page navigation
  const MenuNavigationButton({
    super.key, 
    this.caption = '', 
    this.routeBuilder, 
    this.style, 
    this.textStyle,
  });
  //
  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = textStyle ?? Theme.of(context).textTheme.titleLarge?.copyWith(overflow: TextOverflow.fade);
    final buttonStyle = style ?? const ButtonStyle().copyWith(
      backgroundColor: WidgetStateProperty.all(Theme.of(context).cardColor),
      minimumSize: WidgetStateProperty.all(const Size(0.0, 128.0)),
    );
    return ElevatedButton(
      style: buttonStyle,
      onPressed: routeBuilder != null ? () {
        Navigator.of(context).push(
          routeBuilder!.call(),
        );
      } : null, 
      child: Text(
        caption,
        textAlign: TextAlign.center,
        style: buttonTextStyle,
      ),
    );
  }
}
