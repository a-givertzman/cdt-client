///
/// Form field emptiness validation
class EmptinessFiledValidation {
  ///
  /// Check if field is empty
  String? validateNotEmpty(value) {
    if (value == null || value.isEmpty) {
      return 'This field is necessarily required';
    }
    return null;
  }
}