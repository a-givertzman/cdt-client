import 'dart:math';
import 'package:flutter/material.dart';
///
/// Grid for placing buttons on menu page.
/// Consist of several rows. Their number is calculated 
/// automatically relative to the screen size.
/// Fills empty elements in the row with empty sizedbox.
class MenuGrid extends StatelessWidget {
  final int itemsPerRow;
  final double horizontalSpacing;
  final double verticalSpacing;
  final List<Widget> children;
  final Widget cellFillament;
  /// 
  /// Grid for placing buttons on the menu page.
  /// 
  /// [children] - widgets that will be displayed in the grid
  /// [cellFillament] - widget for empty cell in the row
  const MenuGrid({
    super.key,
    this.itemsPerRow = 2,
    this.children = const [],
    this.horizontalSpacing = 8.0, 
    this.verticalSpacing = 8.0,
    this.cellFillament = const SizedBox(),
  });
  //
  @override
  Widget build(BuildContext context) {
    final rowsCount = (children.length / itemsPerRow.toDouble()).ceil();
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(
          color: Colors.transparent, 
          width: horizontalSpacing,
        ),
        verticalInside: BorderSide(
          color: Colors.transparent, 
          width: verticalSpacing,
        ),
      ),
      children: [
        for (int i=0; i < rowsCount; i++)
          TableRow(
            children: _PaddedIterable(
              targetLength: itemsPerRow,
              fillament: cellFillament,
              items: children.sublist(
                i*itemsPerRow, 
                min((i+1)*itemsPerRow, children.length),
              ), 
            ).items.map(
              (widget) => Padding(
                padding: EdgeInsets.symmetric(
                  vertical: verticalSpacing / 2,
                  horizontal: horizontalSpacing / 2,
                ),
                child: widget,
              ),
            ).toList(),
          ),
      ],
    );
  }
}
//
class _PaddedIterable<T> {
  final int _targetLength;
  final T _fillament;
  final Iterable<T> _items;
  //
  const _PaddedIterable({
    required int targetLength, 
    required T fillament, 
    required Iterable<T> items,
  }) : 
    _targetLength = targetLength, 
    _fillament = fillament, 
    _items = items,
    assert(items.length <= targetLength);
  //
  Iterable<T> get items => _items.length == _targetLength 
    ? _items
    : [
      ..._items,
      ...Iterable.generate(
        _targetLength - _items.length, 
        (_) => _fillament,
      ),
    ];
}
