import 'dart:async';

import 'package:cdt_client/app_widget.dart';
import 'package:ext_rw/ext_rw.dart';
import 'package:flutter/material.dart' hide Localizations;
import 'package:flutter/rendering.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_core/hmi_core_json.dart';
import 'package:hmi_core/hmi_core_log.dart';
import 'package:hmi_core/hmi_core_result.dart';
import 'package:hmi_core/hmi_core_text_file.dart';
import 'package:hmi_core/hmi_core_translate.dart';

///
/// Application entry point
Future<void> main() async {
  Log.initialize(level: LogLevel.all);
  const log = Log('main');
  await runZonedGuarded(
    () async {
      debugRepaintRainbowEnabled = false; //Overlay a rotating set of colors when repainting layers in debug mode.
      WidgetsFlutterBinding.ensureInitialized();
      await _initializations();
      runApp(
        AppWidget(
        ),
      );
    },
    (error, stackTrace) => _onError(error, stackTrace, log),
  );
}
Future<void> _initializations() async {
  await Localizations.initialize(
    AppLang.ru,
    jsonMap: JsonMap.fromTextFile(
      const TextFile.asset(
        'assets/translations/translations.json',
      ),
    ),
  );
  await AppSettings.initialize(
    readOnly: JsonMap.fromTextFile(
      const TextFile.asset(
        'assets/settings/app-settings.json',
      ),
    ),
  );
}
///
/// Storing an error into the database 'report' table
void _onError(Object error, StackTrace stackTrace, Log log) {
  final stack = stackTrace.toString().isEmpty ? StackTrace.current : stackTrace.toString();
  log.error('message: $error\nstackTrace: $stack');
  if (const Setting('report').toString() == 'db') {
    final timestamp = DateTime.now().toIso8601String();
    const code = 0;
    final message = error.toString();
    String sql = "insert into report (timestamp, code, message, stack) values ('$timestamp', '$code', '$message', '$stack')";
    SqlAccess(
      address: ApiAddress(host: const Setting('api-host').toString(), port: const Setting('api-port').toInt), 
      authToken: const Setting('api-auth-token').toString(), 
      database: const Setting('api-database').toString(), 
      sqlBuilder: (_, __) {
        return Sql(sql: sql);
      }, 
    ).fetch().then((result) {
      if (result case Err(: final error)) {
        log.error('Storing error report to the database error: $error\n\t stackTrace: $stack, \n\t sql was: $sql');
      }
    });
  }
}
