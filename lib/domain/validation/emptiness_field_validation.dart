import 'package:hmi_core/src/core/result/result.dart';
import 'package:hmi_widgets/hmi_widgets.dart';

///
/// Form field emptiness validation
class EmptinessFiledValidation implements ValidationCase {
  ///
  /// Check if field is empty
  String? validateNotEmpty(value) {
    if (value == null || value.isEmpty) {
      return 'This field is necessarily required';
    }
    return null;
  }

  @override
  ResultF<void> isSatisfiedBy(String? value) {
    // TODO: implement isSatisfiedBy
    throw UnimplementedError();
  }
}