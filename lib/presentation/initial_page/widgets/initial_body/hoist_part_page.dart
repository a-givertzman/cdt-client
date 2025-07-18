import 'package:cdt_client/infrostructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/initial_page/widgets/number_form_field.dart';
import 'package:cdt_client/presentation/initial_page/widgets/drop_down_form_field.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_widgets/src/core/validation/cases/only_double_validation_case.dart';
import 'package:hmi_widgets/src/core/validation/validator.dart';

///
/// Part of [InitialPage] - hoist.
/// First ten fields.
class HoistPartPage extends StatefulWidget {
  //final AppUserStacked users;
  final SgocInit fields;
  final Function(String?) formValidator;
  ///
  /// The body of hoist.
  ///
  /// [users] - all stored users
  /// [fields] - temprorary example of InitialPage content
  /// [formValidator] - function for cheking the whole form validity
  const HoistPartPage({
    super.key,
    //required this.users,
    required this.fields,
    required this.formValidator,
  });
  @override
  State<HoistPartPage> createState() => _HoistPartPageState();
}
//
class _HoistPartPageState extends State<HoistPartPage> {
  @override
  Widget build(BuildContext context) {
    final uiPadding = const Setting('ui-padding').toDouble;
    final uiPaddingDouble = const Setting('ui-paddingDouble').toDouble;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: uiPadding,
      children: [
        SizedBox(height: uiPaddingDouble),
        Text('Параметры механизма подъёма'),
        NumberFormFieldWidget(
          label: 'Грузоподъёмность механизма, т',
          value: widget.fields.get('load'),
          onChanged: (value) => setState(() => widget.fields.update('load', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Высота подъёма механизма, м',
          value: widget.fields.get('lifting-height'),
          onChanged: (value) => setState(() => widget.fields.update('lifting-height', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        DropDownFormFieldWidget(
          label: 'Тип грузозахватного органа',
          value: widget.fields.getOptionsValue('lifting-device'),
          items: widget.fields.getOptions('lifting-device'),
          onChanged: (value) => setState(() {
            widget.fields.update('lifting-device', value);
          }),
          formValidator: widget.formValidator,
        ),
        NumberFormFieldWidget(
          label: 'Номинальная скорость подъёма, м/мин',
          value: widget.fields.get('rated-travelling-hoist-speed'),
          onChanged: (value) => setState(() => widget.fields.update('rated-travelling-hoist-speed', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Замедленная скорость подъёма, м/мин',
          value: widget.fields.get('slow-travelling-hoist-speed'),
          onChanged: (value) => setState(() => widget.fields.update('slow-travelling-hoist-speed', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        DropDownFormFieldWidget(
          label: 'Тип привода механизма подъёма',
          value: widget.fields.getOptionsValue('lifting-mechanism-drive-type'),
          items: widget.fields.getOptions('lifting-mechanism-drive-type'),
          onChanged: (value) => setState(() => widget.fields.update('lifting-mechanism-drive-type', value)),
          formValidator: widget.formValidator,
        ),
        DropDownFormFieldWidget(
          label: 'Продолжительность включения (ПВ)',
          value: widget.fields.getOptionsValue('lifting-duration'),
          items: widget.fields.getOptions('lifting-duration'),
          onChanged: (value) => setState(() => widget.fields.update('lifting-duration', value)),
          formValidator: widget.formValidator,
        ),
        DropDownFormFieldWidget(
          label: 'Система управления приводом',
          value: widget.fields.getOptionsValue('hoist-control-system'),
          items: widget.fields.getOptions('hoist-control-system'),
          onChanged: (value) => setState(() => widget.fields.update('hoist-control-system', value)),
          formValidator: widget.formValidator,
        ),
        DropDownFormFieldWidget(
          label: 'Тип привода механизма подъёма',
          value: widget.fields.getOptionsValue('hoist-group'),
          items: widget.fields.getOptions('hoist-group'),
          onChanged: (value) => setState(() => widget.fields.update('hoist-group', value)),
          formValidator: widget.formValidator,
        ),
        DropDownFormFieldWidget(
          label: 'Тип поднимаемого груза',
          value: widget.fields.getOptionsValue('type-of-lifted-load'),
          items: widget.fields.getOptions('type-of-lifted-load'),
          onChanged: (value) => setState(() => widget.fields.update('type-of-lifted-load', value)),
          formValidator: widget.formValidator,
        ),
      ],
    );
  }
}
