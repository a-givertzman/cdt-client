import 'dart:convert';

import 'package:cdt_client/domain/entities/cot.dart';
import 'package:cdt_client/domain/entities/event.dart';
import 'package:cdt_client/domain/entities/event_kind.dart';
import 'package:cdt_client/domain/types/bytes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hmi_core/hmi_core_log.dart';

void main() {
  Log.initialize();
  final log = Log('event_test');
  test('Event parse from json string test', () async {
    final testData = {
      (01, '{"name":"Event01","cot":"Act","kind":"---","body":{"Request":"01"}}',     Event('Event01', Cot.act, EventKind.unknown, {'Request': '01'})),
      (02, '{"name":"Event02","cot":"Req","kind":"---","body":{"Request":"02"}}',     Event('Event02', Cot.req, EventKind.unknown, {'Request': '02'})),
      (03, '{"name":"Event03","cot":"ReqCon","kind":"---","body":{"Reply":"03"}}',     Event('Event03', Cot.reqCon, EventKind.unknown, {'Reply': '03'})),
    };
    for (final (int step, String val, Event target) in testData) {
      final Event result;
      log.debug('.fromJson | target $target');
      try {
        result = Event.fromJson(val);
        log.debug('.fromJson | result $result');
      } catch (err) {
        fail('step $step, \ntarget: $target, \nerror: $err');
      }
      expect(result == target, true, reason: 'step $step, \nresult: $result, \ntarget: $target');
    }
  });
  test('Event toBytes test', () async {
    final testData = {
      (01, utf8.encode('{"name":"Event01","cot":"Act","kind":"---","body":{"Request":"01"}}'),     Event('Event01', Cot.act, EventKind.unknown, {'Request': '01'})),
      (02, utf8.encode('{"name":"Event02","cot":"Req","kind":"---","body":{"Request":"02"}}'),     Event('Event02', Cot.req, EventKind.unknown, {'Request': '02'})),
      (03, utf8.encode('{"name":"Event03","cot":"ReqCon","kind":"---","body":{"Reply":"03"}}'),     Event('Event03', Cot.reqCon, EventKind.unknown, {'Reply': '03'})),
    };
    for (final (int step, Bytes val, Event target) in testData) {
      final Event result;
      log.debug('.fromJson | target $target');
      try {
        result = Event.fromBytes(val);
        log.debug('.fromJson | result $result');
      } catch (err) {
        fail('step $step, \ntarget: $target, \nerror: $err');
      }
      expect(result == target, true, reason: 'step $step, \nresult: $result, \ntarget: $target');
    }
  });
}
