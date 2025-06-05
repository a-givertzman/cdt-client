import 'package:flutter/material.dart';
import 'package:cdt_client/domain/validation/emptiness_field_validation.dart';
///
/// Widget for NumberFormField
class NumberFormFieldWidget extends StatelessWidget{
  final String label;
  final dynamic value;
  final Function(dynamic) onChanged;
  final Function() formValidator;
  final bool isInteger;
  ///
  /// The body of NumberFormField
  /// 
  /// [label] - lable of certain field
  /// [value] - current value of certain field
  /// [onChanged] - function for changing value of certain field
  /// [formValidator] - function for cheking the whole form validity
  /// [isInteger] - cheking if value is integer or float
  const NumberFormFieldWidget ({
  super.key, 
  required this.label,
  required this.value,
  required this.onChanged,
  required this.formValidator,
  required this.isInteger,
  });
  @override
  Widget build(BuildContext context) {
    final emptinessValidator = EmptinessFiledValidation();
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.3,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: TextFormField(
          initialValue: value?.toString(),
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
          keyboardType: TextInputType.numberWithOptions(
            decimal: !isInteger, 
            signed: true, 
          ),
          onChanged: (value) {
            if (isInteger) {
              final num = int.tryParse(value);
              if (num != null) onChanged(num);
            } else {
              final num = double.tryParse(value);
              if (num != null) onChanged(num);
            }
            formValidator();
          },
          validator: emptinessValidator.validateNotEmpty,
        ),
      ),
    );
  }
}