import 'package:cdt_client/infrostructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/initial_page/widgets/number_form_field.dart';
import 'package:cdt_client/presentation/initial_page/widgets/drop_down_form_field.dart';
import 'package:cdt_client/presentation/initial_page/widgets/text_form_field.dart';
// ignore: implementation_imports
import 'package:hmi_widgets/src/core/validation/cases/only_double_validation_case.dart';
// ignore: implementation_imports
import 'package:hmi_widgets/src/core/validation/validator.dart';
// ignore: implementation_imports
import 'package:hmi_widgets/src/core/validation/cases/min_length_validation_case.dart';
///
/// Part of [InitialPage] - the bridge running mechanism.
/// Eleven fields.
class BridgeRunningMechanismPartPage extends StatefulWidget {
  //final AppUserStacked users;
  final SgocInit fields;
  final Function(String?) formValidator;
  ///
  /// The body of the bridge running mechanism.
  ///
  /// [users] - all stored users
  /// [fields] - temprorary example of InitialPage content
  /// [formValidator] - function for cheking the whole form validity
  const BridgeRunningMechanismPartPage({
    super.key,
    //required this.users,
    required this.fields,
    required this.formValidator,
  });
  @override
  State<BridgeRunningMechanismPartPage> createState() => _BridgeRunningMechanismPartPageState();
}
//
// BridgeRunningMechanismPartPage.dart
class _BridgeRunningMechanismPartPageState extends State<BridgeRunningMechanismPartPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Параметры механизма передвижения крана',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        NumberFormFieldWidget(
          label: 'Номинальная скорость передвижения моста, м/мин',
          value: widget.fields.get('rated-travelling-bridge-speed'),
          onChanged: (value) => setState(() => widget.fields.update('rated-travelling-bridge-speed', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Замедленная скорость передвижения моста, м/мин',
          value: widget.fields.get('slow-travelling-bridge-speed'),
          onChanged: (value) => setState(() => widget.fields.update('slow-travelling-bridge-speed', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        DropDownFormFieldWidget(
          label: 'Режим работы механизма передвижения моста крана',
          value: widget.fields.getOptionsValue('crane-drive-group'),
          items: widget.fields.getOptions('crane-drive-group'),
          onChanged: (value) => setState(() => widget.fields.update('crane-drive-group', value)),
          formValidator: widget.formValidator,
        ),
        DropDownFormFieldWidget(
          label: 'Продолжительность включения (ПВ) механизма',
          value: widget.fields.getOptionsValue('bridge-movement-duration'),
          items: widget.fields.getOptions('bridge-movement-duration'),
          onChanged: (value) => setState(() => widget.fields.update('bridge-movement-duration', value)),
          formValidator: widget.formValidator,
        ),
        DropDownFormFieldWidget(
          label: 'Система управления приводом',
          value: widget.fields.getOptionsValue('bridge-control-system'),
          items: widget.fields.getOptions('bridge-control-system'),
          onChanged: (value) => setState(() => widget.fields.update('bridge-control-system', value)),
          formValidator: widget.formValidator,
        ),
        DropDownFormFieldWidget(
          label: 'Тип токоподвода к крану',
          value: widget.fields.getOptionsValue('crane-power-system'),
          items: widget.fields.getOptions('crane-power-system'),
          onChanged: (value) => setState(() => widget.fields.update('crane-power-system', value)),
          formValidator: widget.formValidator,
        ),
        DropDownFormFieldWidget(
          label: 'Тип механизма передвижения',
          value: widget.fields.getOptionsValue('bridge-drive-type-system'),
          items: widget.fields.getOptions('bridge-drive-type-system'),
          onChanged: (value) => setState(() => widget.fields.update('bridge-drive-type-system', value)),
          formValidator: widget.formValidator,
        ),
        DropDownFormFieldWidget(
          label: 'Схема привода передвижения крана',
          value: widget.fields.getOptionsValue('bridge-drive-diagram'),
          items: widget.fields.getOptions('bridge-drive-diagram'),
          onChanged: (value) => setState(() => widget.fields.update('bridge-drive-diagram', value)),
          formValidator: widget.formValidator,
        ),
        DropDownFormFieldWidget(
          label: 'Система синхронизации механизма передвижения крана',
          value: widget.fields.getOptionsValue('bridge-control-system-of-synchronous-movement'),
          items: widget.fields.getOptions('bridge-control-system-of-synchronous-movement'),
          onChanged: (value) => setState(() => widget.fields.update('bridge-control-system-of-synchronous-movement', value)),
          formValidator: widget.formValidator,
        ),
        TextFormFieldWidget(
          label: 'Тип подкранового пути',
          value: widget.fields.get('type-crane-rail'),
          onChanged: (value) => setState(() => widget.fields.update('type-crane-rail', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        NumberFormFieldWidget(
          label: 'Длина подкранового пути, м',
          value: widget.fields.get('crane-rail-length'),
          onChanged: (value) => setState(() => widget.fields.update('crane-rail-length', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
