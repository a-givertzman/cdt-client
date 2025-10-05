import 'package:flutter/material.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Widget for TextFormField
class TextFormFieldWidget extends StatelessWidget{
  final String _label;
  final dynamic _value;
  final Function(dynamic) _onChanged;
  final Validator? _validator;
  ///
  /// The body of TextFormField
  /// 
  /// - [label] - label of certain field
  /// - [value] - current value of certain field
  /// - [onChanged] - function for changing value of certain field
  /// - [validator] -  function for validating certain field
  const TextFormFieldWidget ({
    super.key, 
    required String label,
    required dynamic value,
    required dynamic Function(dynamic) onChanged,
    Validator? validator,
  })  : _validator = validator, 
        _onChanged = onChanged, 
        _value = value, 
        _label = label;
  //
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
      onChanged: (value) => _onChanged(value),
      validator: (value) => _validator?.editFieldValidator(value),
    );
  }
}
