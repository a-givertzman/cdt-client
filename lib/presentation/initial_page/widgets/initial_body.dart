import 'package:flutter/material.dart';
import 'package:hmi_networking/hmi_networking.dart';
import 'package:cdt_client/presentation/core/widgets/pages_switch/form_page.dart';
///
/// [InitialPage] body widget.
/// The form provides view / edit of [initial data](https://github.com/a-givertzman/cdt-math/blob/master/design/docs/algorithm_single_ginger_overhead_crane/part01_initialization/chapter01_initialData/chapter01_initialData.md).
/// Access to edit may be restricted depends on user priveleges.
class InitialBody extends StatefulWidget {
  final Pages form;
  // final Map<Pages, Map> pageData;
  final AppUserStacked users;
  final Function(bool isValid)? onValidationChanged;
  ///
  /// The body of the [InitialPage] widget.
  ///
  /// [form] - current form
  /// [pageData] - content of all forms
  /// [users] - all stored users
  /// [onValidationChanged] - callback for checking is form valid
  const InitialBody({
    super.key,
    required this.form,
    //required this.pageData,
    required this.users,
    required this.onValidationChanged,
  });
  @override
  State<InitialBody> createState() => _InitialBodyState();
}
//
class _InitialBodyState extends State<InitialBody> {
  final _formKey = GlobalKey<FormState>();
  bool _checkboxValue = true;
  String? _dropdownValue;
  String _textValue = 'Value from Server';
  //
  @override
  Widget build(BuildContext context) {
    return Form(
      // Добавлен Form виджет
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // drop down menu field
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.25,
              child: DropdownButtonFormField<String>(
                value: _dropdownValue,
                decoration: InputDecoration(
                  labelText: 'Name of the field',
                  border: const OutlineInputBorder(),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                ),
                items:
                    <String>[
                      'Value One',
                      'Value Two',
                      'Value Three',
                      'Value Four',
                      'Value From Server',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                onChanged: (String? value) {
                  setState(() => _dropdownValue = value);
                  _validateForm();
                },
                validator: _validateNotEmpty,
              ),
            ),
            const SizedBox(height: 20),
            // text field
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.25,
              child: TextFormField(
                initialValue: _textValue,
                decoration: const InputDecoration(
                  labelText: 'Name of the field',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2.0,),
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
                  _textValue = value;
                  _validateForm();
                },
                validator: _validateNotEmpty,
              ),
            ),
            const SizedBox(height: 20),
            // bool field
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.25,
              child: InputDecorator(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Name of the field',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Checkbox(
                      value: _checkboxValue,
                      onChanged: (value) {
                        setState(() {
                          _checkboxValue = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
  ///
  /// Check if field is empty
  String? _validateNotEmpty(String? value) {
    return value == null || value.isEmpty ? 'This field is necessarily required' : null;
  }
  ///
  /// Check if all fields in form are not empty
  /// and notificate [PagesSwitch].
  void _validateForm() {
    final isValid = validate();
    widget.onValidationChanged?.call(isValid);
  }
  ///
  /// Check if all fields in form are not empty
  bool validate() {
    return _formKey.currentState?.validate() ?? false;
  }
}
