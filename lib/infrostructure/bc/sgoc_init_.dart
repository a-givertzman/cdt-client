import 'package:hmi_core/hmi_core_failure.dart';

///
/// TODO
/// 
/// [CDT Docs refeerence](https://github.com/a-givertzman/cdt-math/blob/master/design/docs/algorithm/part01/initial_data.md)
class SgocInit {
  final Map<String, dynamic> _map;
  ///
  /// Returns new instance created with specified json map
  SgocInit(
    Map<String, dynamic> map
  ) :
    _map = map;
  ///
  /// Returns field value if exists
  String get(key) {
    final val = _map[key];
    if (val != null) {
      return val;
    }
    throw Failure(message: 'BcInit.get | internal _map does not contains `$key` key', stackTrace: StackTrace.current);
  }
}