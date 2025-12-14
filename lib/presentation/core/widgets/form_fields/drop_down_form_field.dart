import 'package:flutter/material.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Widget for DropDownMenuFormField 
class DropDownFormFieldWidget extends StatelessWidget {
  final String _label;
  final String _value;
  final List<String> _items;
  final Function(dynamic) _onChanged;
  final Validator? _validator;
  ///
  /// The body of DropDownMenuFormField
  /// 
  /// - [label] - label of certain field
  /// - [value] - current value of certain field
  /// - [items] - list of values of certain field
  /// - [onChanged] - function for changing value of certain field
  /// - [validator] -  function for validating certain field
  const DropDownFormFieldWidget ({
    super.key, 
    required String label,
    required String value,
    required List<String> items,
    required dynamic Function(dynamic) onChanged,
    required Validator? validator,
  })  : _validator = validator, 
        _onChanged = onChanged, 
        _items = items, 
        _value = value, 
        _label = label;
  //
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _items.contains(_value) ? _value : null,
      decoration: InputDecoration(
        labelText: _label,
        focusedBorder: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        enabledBorder: OutlineInputBorder(),
      ),
      items: [
        DropdownMenuItem<String>(value: '', child: Text('-')),
        ..._items.map(
          (dynamic item) => DropdownMenuItem<String>(
            value: item,
            child: Text(item.toString()),
          ),
        ),
      ],
      onChanged: (dynamic value) => _onChanged(value),
      validator: (value) => _validator?.editFieldValidator(value),
    );
  }
}
