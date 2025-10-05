import 'package:flutter/material.dart';
import 'package:hmi_widgets/hmi_widgets.dart';

///
/// Widget for form number field.
class NumberFormFieldWidget extends StatelessWidget{
  final String _label;
  final String _value;
  final Function(dynamic) _onChanged;
  final TextInputType? _keyboardType;
  final Validator? _validator;
  ///
  /// Widget for form number field.
  /// Takes user input and validates it
  /// by [validator] func.
  /// 
  /// - [label] - label of certain field
  /// - [value] - current value of certain field
  /// - [onChanged] - function for changing value of certain field
  /// - [validator] -  function for validating certain field
  const NumberFormFieldWidget ({
    super.key, 
    required String label,
    required String value,
    required dynamic Function(dynamic) onChanged,
    TextInputType? keyboardType,
    Validator? validator,
  })  : _value = value, 
        _label = label,
        _validator = validator, _onChanged = onChanged, 
        _keyboardType = keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: _value,
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
      keyboardType: _keyboardType,
      onChanged: (value) => _onChanged(value),
      validator: (value) => _validator?.editFieldValidator(value),
    );
  }
}
