import 'package:cdt_client/presentation/initial_page/widgets/initial_body/general_crane_parameters_part_page.dart';
import 'package:cdt_client/presentation/initial_page/widgets/initial_body/overall_dimensions_crane_part_page.dart';
import 'package:flutter/material.dart';
import 'package:hmi_networking/hmi_networking.dart';
import 'package:cdt_client/presentation/core/widgets/pages_switch/form_page.dart';
import 'package:cdt_client/presentation/initial_page/widgets/initial_body/hoist_part_page.dart';
import 'package:cdt_client/presentation/initial_page/widgets/initial_body/trolley_running_mechanism_part_page.dart';
import 'package:cdt_client/presentation/initial_page/widgets/initial_body/bridge_running_mechanism_part_page.dart';
///
/// [InitialPage] body widget.
/// The form provides view / edit of [initial data](https://github.com/a-givertzman/cdt-math/blob/master/design/docs/algorithm_single_ginger_overhead_crane/part01_initialization/chapter01_initialData/chapter01_initialData.md).
/// Access to edit may be restricted depends on user priveleges.
class InitialBody extends StatefulWidget {
  final Pages form;
  // final Map<Pages, Map> pageData;
  final AppUserStacked users;
  final Map<int, dynamic> data;
  final Function(bool isValid)? onValidationChanged;
  ///
  /// The body of the [InitialPage] widget.
  ///
  /// [form] - current form
  /// [data] - temprorary example of InitialPage content
  /// [pageData] - content of all forms
  /// [users] - all stored users
  /// [onValidationChanged] - callback for checking is form valid
  const InitialBody({
    super.key,
    required this.form,
    required this.data,
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
  //
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HoistPartPage(data: widget.data, formValidator: _formValidator),
              TrolleyRunningMechanismPartPage(data: widget.data, formValidator: _formValidator),
              BridgeRunningMechanismPartPage(data: widget.data, formValidator: _formValidator),
              GeneralCraneParametersPartPage(data: widget.data, formValidator: _formValidator),
              OverallDimensionsCranePartPage(data: widget.data, formValidator: _formValidator),
            ],
          ),
        ),
      ),
    );
  }
  ///
  /// Check if all fields in form are not empty
  /// and notificate [PagesSwitch].
  void _formValidator() {
    final isValid = _validate();
    widget.onValidationChanged?.call(isValid);
  }
  ///
  /// Check if all fields in form are not empty
  bool _validate() {
    return _formKey.currentState?.validate() ?? false;
  }
}
// ElevatedButton(
              //   onPressed: _validateForm,
              //   child: const Text('Сохранить'),
              // ),
              // SizedBox(
              //   width: MediaQuery.sizeOf(context).width * 0.25,
              //   child: InputDecorator(
              //     decoration: InputDecoration(
              //       enabledBorder: OutlineInputBorder(),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           'Name of the field',
              //           style: Theme.of(context).textTheme.bodyLarge,
              //         ),
              //         Checkbox(
              //           value: _checkboxValue,
              //           onChanged: (value) {
              //             setState(() {
              //               _checkboxValue = value ?? false;
              //             });
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // ),