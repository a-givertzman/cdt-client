///
/// Enum that contains indexes of forms.
enum Pages { first, second, third }
//
extension PageOperators on Pages {
  ///
  /// Increasing operator
  Pages add([int? val]) {
    return Pages.values[index + (val ?? 1)];
  }
  ///
  /// Decreasing operator
  Pages sub([int? val]) {
    return Pages.values[index - (val ?? 1)];
  }
}
