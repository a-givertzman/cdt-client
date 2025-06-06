import 'package:flutter/material.dart';
import 'package:cdt_client/domain/validation/emptiness_field_validation.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Widget for TextFormField
class TextFormFieldWidget extends StatelessWidget{
  final String label;
  final dynamic value;
  final Function(dynamic) onChanged;
  final Function() formValidator;
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
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.3,
      child: Padding(
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
          onChanged: (value) {
            onChanged(value);
            formValidator();
          },
          validator: (value) => validator?.editFieldValidator(value),
        ),
      ),
    );
  }
}