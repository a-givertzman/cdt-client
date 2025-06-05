import 'package:hmi_core/hmi_core_failure.dart';
import 'package:hmi_core/hmi_core_result.dart';
import 'package:hmi_widgets/hmi_widgets.dart';

///
/// Check if input is a valid double number
/// - 10.10 - Ok
/// - .10 - Ok
/// - 0 - Ok
/// - 0. - Err
class OnlyDoubleValidationCase implements ValidationCase {
  ///
  /// Check if input is a valid double number
  const OnlyDoubleValidationCase();
  //
  @override
  Result<void, Failure> isSatisfiedBy(String? value) {
    if(value != null && value.isNotEmpty) {
      final regex = RegExp(r'^[\d]*\.?[\d]+$');
      final matches = regex.allMatches(value);
      // final m = matches.map((m) => m[0]).join(', ');
      if (matches.length == 1) {
        return Ok(null);
      }
    }
    return Err(
      Failure(
        message: 'Only Double expected',
        stackTrace: StackTrace.current,
      ),
    );
  }

}