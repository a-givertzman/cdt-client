import 'package:cdt_client/domain/entities/cot.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Cot parse from string test', () async {
    final testData = {
      (01, 'Inf',     Cot.inf),
      (02, 'Act',     Cot.act),
      (03, 'ActCon',  Cot.actCon),
      (04, 'ActErr',  Cot.actErr),
      (05, 'Req',     Cot.req),
      (06, 'ReqCon',  Cot.reqCon),
      (07, 'ReqErr',  Cot.reqErr),
      (08, '---',     Cot.unknown),
    };
    for (final (int step, String val, Cot target) in testData) {
      final result = Cot.fromString(val);
      expect(result, target, reason: 'step $step, \nresult: $result, \ntarget: $target');
    }
  });
  test('Cot toString test', () async {
    final testData = {
      (01, 'Inf',     Cot.inf),
      (02, 'Act',     Cot.act),
      (03, 'ActCon',  Cot.actCon),
      (04, 'ActErr',  Cot.actErr),
      (05, 'Req',     Cot.req),
      (06, 'ReqCon',  Cot.reqCon),
      (07, 'ReqErr',  Cot.reqErr),
      (08, 'Unknown', Cot.unknown),
    };
    for (final (int step, String target, Cot cot) in testData) {
      final result = cot.toString();
      expect(result, target, reason: 'step $step, \nresult: $result, \ntarget: $target');
    }
  });
}
