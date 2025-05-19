import 'package:cdt_client/presentation/auth/sign_in/sign_in_page.dart';
import 'package:cdt_client/presentation/home_page/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:hmi_core/hmi_core_json.dart';
import 'package:hmi_core/hmi_core_text_file.dart';
import 'package:hmi_networking/hmi_networking.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
import 'package:window_manager/window_manager.dart';

///
/// Application entry point widget
class AppWidget extends StatefulWidget {
  final AppThemeSwitch? themeSwitch;
  ///
  /// Application entry point widget
  const AppWidget({
    super.key,
    this.themeSwitch,
  });
  //
  @override
  State<AppWidget> createState() => _AppWidgetState();
}
//
class _AppWidgetState extends State<AppWidget> {
  //
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        await windowManager.ensureInitialized();
        windowManager.setFullScreen(true);
        windowManager.setTitleBarStyle(TitleBarStyle.hidden);
        windowManager.setBackgroundColor(Colors.transparent);
        // windowManager.setSize(const Size(1024, 768));
        // windowManager.center();
        windowManager.focus();
        WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {true;}));
      },
    );
  }
  //
  @override
  void dispose() {
    widget.themeSwitch?.dispose();
    super.dispose();
  }
  ///
  void _themeSwitchListener() {
    if (mounted) {
      setState(() {true;});
    }
  }
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(
        auth: Authenticate(
          user: AppUserSingle.fromJson(
            JsonMap.fromTextFile(
              const TextFile.asset('assets/settings/users.json'),
            ),
          ),
          // user: AppUserSingle.remote(
          //   remote: DataSource.dataSet('app-user'),
          // ),
        ), 
      ),
      initialRoute: '/signInPage',
      routes: {
        '/signInPage': (context) => SignInPage(
          auth: Authenticate(
            user: AppUserSingle.fromJson(
              JsonMap.fromTextFile(
                const TextFile.asset('assets/settings/users.json'),
              ),
            ),
          ),
        ),
      },
      theme: widget.themeSwitch?.themeData,
    );
  }
}
