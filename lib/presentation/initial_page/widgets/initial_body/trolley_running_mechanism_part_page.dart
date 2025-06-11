import 'package:cdt_client/infrostructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/initial_page/widgets/number_form_field.dart';
import 'package:cdt_client/presentation/initial_page/widgets/drop_down_menu_form_field.dart';
// ignore: implementation_imports
import 'package:hmi_widgets/src/core/validation/cases/only_digits_validation_case.dart';
// ignore: implementation_imports
import 'package:hmi_widgets/src/core/validation/validator.dart';
///
/// Part of [InitialPage] - the trolley running mechanism.
/// FIve fields.
class TrolleyRunningMechanismPartPage extends StatefulWidget {
  //final AppUserStacked users;
  final SgocInit fields;
  final Function(String?) formValidator;
  ///
  /// The body of the trolley running mechanism.
  ///
  /// [users] - all stored users
  /// [fields] - temprorary example of InitialPage content
  /// [formValidator] - function for cheking the whole form validity
  const TrolleyRunningMechanismPartPage({
    super.key,
    //required this.users,
    required this.fields,
    required this.formValidator,
  });
  @override
  State<TrolleyRunningMechanismPartPage> createState() => _TrolleyRunningMechanismPartPageState();
}
//
class _TrolleyRunningMechanismPartPageState extends State<TrolleyRunningMechanismPartPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Параметры механизма передвижения грузовой тали',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        NumberFormFieldWidget(
          label: 'Номинальная скорость передвижения тали, м/мин',
          value: widget.fields.get('rated-travelling-trolley-speed'),
          onChanged: (value) => setState(() => widget.fields.update('rated-travelling-trolley-speed', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDigitsValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Замедленная скорость передвижения тали, м/мин',
          value: widget.fields.get('slow-travelling-trolley-speed'),
          onChanged: (value) => setState(() => widget.fields.update('slow-travelling-trolley-speed', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDigitsValidationCase()]),
        ),
        DropDownMenuFormFieldWidget(
          label: 'Режим работы механизма передвижения тали',
          value: widget.fields.getOptionsValue('trolley-group'),
          items: widget.fields.getOptions('trolley-group'),
          onChanged: (value) => setState(() => widget.fields.update('trolley-group', value)),
          formValidator: widget.formValidator,
        ),
        DropDownMenuFormFieldWidget(
          label: 'Система управления приводом',
          value: widget.fields.getOptionsValue('trolley-control-system'),
          items: widget.fields.getOptions('trolley-control-system'),
          onChanged: (value) => setState(() => widget.fields.update('trolley-control-system', value)),
          formValidator: widget.formValidator,
        ),
        DropDownMenuFormFieldWidget(
          label: 'Тип токоподвода к грузовой тали',
          value: widget.fields.getOptionsValue('trolley-power-system'),
          items: widget.fields.getOptions('trolley-power-system'),
          onChanged: (value) => setState(() => widget.fields.update('ttrolley-power-system', value)),
          formValidator: widget.formValidator,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
