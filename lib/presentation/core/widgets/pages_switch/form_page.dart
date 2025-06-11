///
/// Enum that contains indexes of Pages of the `PageView`.
/// Used for counting the pages and switching between.
enum Pages { initialPage, advnSettPageFirst, advnSettPageSecond }
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
