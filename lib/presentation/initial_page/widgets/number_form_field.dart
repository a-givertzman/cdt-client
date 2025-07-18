import 'package:flutter/material.dart';
import 'package:hmi_widgets/hmi_widgets.dart';

///
/// Widget for NumberFormField
class NumberFormFieldWidget extends StatelessWidget{
  // final TextEditingController controller;
  final String label;
  final String value;
  final TextInputType? keyboardType;
  final Function(dynamic)? onChanged;
  final Function(String?)? formValidator;
  final Validator? validator;
  ///
  /// The body of NumberFormField
  /// 
  /// [label] - lable of certain field
  /// [value] - current value of certain field
  /// [onChanged] - function for changing value of certain field
  /// [formValidator] - function for cheking the whole form validity
  const NumberFormFieldWidget ({
    super.key, 
    required this.label,
    required this.value,
    this.keyboardType,
    this.onChanged,
    this.formValidator,
    this.validator,
  });
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
      keyboardType: keyboardType,
      onChanged: (value) {
        formValidator?.call(
          validator?.editFieldValidator(value)
        );
      },
      validator: (value) => validator?.editFieldValidator(value),
    );
  }
}