import 'package:flutter/material.dart';
///
/// Widget for DropDownMenuFormField 
class DropDownMenuFormFieldWidget extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  final Function(dynamic) onChanged;
  final Function() formValidator;
  ///
  /// The body of DropDownMenuFormField
  /// 
  /// [label] - lable of certain field
  /// [value] - current value of certain field
  /// [items] - list of values of certain field
  /// [onChanged] - function for changing value of certain field
  /// [formValidator] - function for cheking the whole form validity
  const DropDownMenuFormFieldWidget ({
    super.key, 
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.formValidator,
  });
  //
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.3,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: DropdownButtonFormField<String>(
          value: items.contains(value) ? value : null,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
          ),
          items: [
            DropdownMenuItem<String>(value: null, child: Text('-')),
            ...items.map(
              (dynamic item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item.toString()),
              ),
            ),
          ],
          onChanged: (dynamic value) {
            onChanged(value);
            formValidator();
          },
          // validator: emptinessValidator.validateNotEmpty,
        ),
      ),
    );
  }
}