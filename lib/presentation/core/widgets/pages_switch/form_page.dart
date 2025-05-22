///
/// Enum of forms indexes which are presented
/// in the form of String
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
