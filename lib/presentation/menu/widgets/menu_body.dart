import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hmi_networking/hmi_networking.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:cdt_client/presentation/menu/widgets/menu_grid.dart';
import 'package:cdt_client/presentation/menu/widgets/menu_navigation_button.dart';
import 'package:cdt_client/presentation/home_page/home_page.dart';
import 'package:cdt_client/presentation/core/widgets/pages_switch/pages_switch_with_bottom_indication.dart';
///
/// Builds menu body using current user.
/// Menu body is a grid that contains
/// buttons thats navigates to different
/// pages of this app.
class MenuBody extends StatelessWidget {
  static const _log = Log('MenuBody');
  final AppUserStacked _users;
  //final AppThemeSwitch _themeSwitch;
  ///
  /// Builds menu body using current user.
  ///
  /// [users] - list of all stored useres
  const MenuBody({
    Key? key,
    required AppUserStacked users,
    //required AppThemeSwitch themeSwitch,
  }) : 
    _users = users,
    //_themeSwitch = themeSwitch,
    super(key: key);
  /// 
  /// Builds menu body widget
  @override
  Widget build(BuildContext context) {
    _log.debug('[.build]');
    //final user = _users.peek;
    final blockPadding = const Setting('blockPadding').toDouble;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final displaySizeHeight = const Setting('displaySizeHeight').toDouble;
    final displaySizeWidth = const Setting('displaySizeWidth').toDouble;
    final scaleRatio = height / displaySizeHeight;
    final textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(overflow: TextOverflow.fade);
    final fontSize = textStyle?.fontSize ?? 24 * scaleRatio;
    final textStyleScaled = textStyle?.copyWith(fontSize: fontSize);
    final menuHorizontalPadding = blockPadding * 4;
    final menuWidth = displaySizeWidth - menuHorizontalPadding * 2;
    return Transform.scale(
      scale: min(
        width / displaySizeWidth, 
        height /displaySizeHeight,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: menuHorizontalPadding),
              child: SizedBox(
                width: menuWidth,
                child: MenuGrid(
                  itemsPerRow: 4,
                  horizontalSpacing: blockPadding,
                  verticalSpacing: blockPadding,
                  cellFillament: MenuNavigationButton(
                    caption: const Localized('Reserved').v,
                    textStyle: textStyleScaled,
                  ),
                  children: [
                    MenuNavigationButton(
                      caption: const Localized('Home page').v,
                      textStyle: textStyleScaled,
                      routeBuilder: () => MaterialPageRoute(
                        builder: (context) => HomePage(
                          users: _users,
                          //themeSwitch: _themeSwitch,
                        ),
                        settings: const RouteSettings(name: "/homePage"),
                      ),
                    ),
                    MenuNavigationButton(
                      caption: const Localized('Initial page').v,
                      textStyle: textStyleScaled,
                      routeBuilder: () => MaterialPageRoute(
                        builder: (context) => PagesSwitch(
                          users: _users,
                          //themeSwitch: _themeSwitch,
                        ),
                        settings: const RouteSettings(name: "/initialPage"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
