import 'package:flutter/material.dart';
import 'package:hmi_widgets/hmi_widgets.dart';

///
/// Widget for TextFormField
class TextFormFieldWidget extends StatelessWidget{
  final String label;
  final dynamic value;
  final Function(dynamic) onChanged;
  final Function(String?) formValidator;
  final Validator? validator;
  ///
  /// The body of TextFormField
  /// 
  /// [label] - lable of certain field
  /// [value] - current value of certain field
  /// [onChanged] - function for changing value of certain field
  /// [formValidator] - function for cheking the whole form validity
  const TextFormFieldWidget ({
    super.key, 
    required this.label,
    required this.value,
    required this.onChanged,
    required this.formValidator,
    this.validator,
  });
  //
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        focusedBorder: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        enabledBorder: OutlineInputBorder(),
      ),
      onChanged: (value) {
        onChanged(value);
        formValidator.call(
          validator?.editFieldValidator(value)
        );
      },
      validator: (value) => validator?.editFieldValidator(value),
    );
  }
}