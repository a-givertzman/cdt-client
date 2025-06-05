import 'package:hmi_core/hmi_core_failure.dart';
import 'package:hmi_core/hmi_core_log.dart';
import 'package:hmi_core/hmi_core_result.dart';
///
/// Storage parametrs for initialization Single Girder Overhead Crane
/// 
/// [CDT Docs refeerence](https://github.com/a-givertzman/cdt-math/blob/master/design/docs/algorithm_single_ginger_overhead_crane/part01_initialization/chapter01_initialData/chapter01_initialData.md)
class SgocInit {
  final Log _log;
  final Map<String, dynamic> _map;
  ///
  /// Returns new instance created with specified json map
  const SgocInit(
    Map<String, dynamic> map
  ) :
    _log = const Log('SgocInit'),
    _map = map;
  ///
  /// Returns field value if exists
  dynamic get(String key) {
    final val = _map[key];
    if (val != null) {
      return val;
    }
    throw Failure(message: 'BcInit.get | internal _map does not contains `$key` key', stackTrace: StackTrace.current);
  }
  ///
  /// Returns field value of nested map if exists
  dynamic getOptionsValue(String key) {
    final val = _map[key]?['value'];
    if (val != null) {
      return val;
    }
    throw Failure(message: 'BcInit.get | internal _map does not contains `$key` key', stackTrace: StackTrace.current);
  }
  ///
  /// Returns field value of nested map if exists
  dynamic getOptions(String key) {
    final val = _map[key]?['options'];
    if (val != null) {
      return val;
    }
    throw Failure(message: 'BcInit.get | internal _map does not contains `$key` key', stackTrace: StackTrace.current);
  }
  ///
  /// Updates value by it's key if exists
  Result<void, Failure> update(String key, dynamic value) {
    if (!_map.containsKey(key)) {
      _log.warn(' | Key `$key` - is not found');
    }
    final val = _map[key];
    if (val != null && val is Map) {
      (_map[key] as Map).update('value', value);
      return Ok(null);
    }
    _map.update(key, value, ifAbsent: () => value);
    return Ok(null);
  }
}
