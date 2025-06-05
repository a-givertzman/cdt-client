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
  final Function()? formValidator;
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
    // controller = TextEditingController(text: value);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        onChanged: (value) {
          // if (isInteger) {
          //   final num = int.tryParse(value);
          //   if (num != null) onChanged(num);
          // } else {
          //   final num = double.tryParse(value);
          //   if (num != null) onChanged(num);
          // }
          formValidator?.call();
        },
        validator: (value) => validator?.editFieldValidator(value),
      ),
    );
  }
}