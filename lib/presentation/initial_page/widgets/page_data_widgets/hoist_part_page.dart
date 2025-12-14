import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/number_form_field.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/drop_down_form_field.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_core/hmi_core_translate.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Part of [FirstPage] - hoist.
/// First ten fields.
class HoistPartPage extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// The body of hoist.
  ///
  /// [fields] - temporary example of InitialPage content
  const HoistPartPage({
    super.key,
    required SgocInit fields,
  })  : _fields = fields;
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
        Text('Lifting mechanism parameters'.loc),
        NumberFormFieldWidget(
          label: 'Load, t'.loc,
          value: widget._fields.get('load'),
          onChanged: (value) => setState(() => widget._fields.update('load', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Lifting height, m'.loc,
          value: widget._fields.get('lifting-height'),
          onChanged: (value) => setState(() => widget._fields.update('lifting-height', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        DropDownFormFieldWidget(
          label: 'Lifting device'.loc,
          value: widget._fields.getOptionsValue('lifting-device'),
          items: widget._fields.getOptions('lifting-device'),
          onChanged: (value) => setState(() {
            widget._fields.update('lifting-device', value);
          }),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        NumberFormFieldWidget(
          label: 'Rated traveling hoist speed, m/min'.loc,
          value: widget._fields.get('rated-traveling-hoist-speed'),
          onChanged: (value) => setState(() => widget._fields.update('rated-traveling-hoist-speed', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Slow traveling hoist speed, m/min'.loc,
          value: widget._fields.get('slow-traveling-hoist-speed'),
          onChanged: (value) => setState(() => widget._fields.update('slow-traveling-hoist-speed', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        DropDownFormFieldWidget(
          label: 'Lifting mechanism drive type'.loc,
          value: widget._fields.getOptionsValue('lifting-mechanism-drive-type'),
          items: widget._fields.getOptions('lifting-mechanism-drive-type'),
          onChanged: (value) => setState(() => widget._fields.update('lifting-mechanism-drive-type', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Lifting duration'.loc,
          value: widget._fields.getOptionsValue('lifting-duration'),
          items: widget._fields.getOptions('lifting-duration'),
          onChanged: (value) => setState(() => widget._fields.update('lifting-duration', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Hoist control system'.loc,
          value: widget._fields.getOptionsValue('hoist-control-system'),
          items: widget._fields.getOptions('hoist-control-system'),
          onChanged: (value) => setState(() => widget._fields.update('hoist-control-system', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Hoist group'.loc,
          value: widget._fields.getOptionsValue('hoist-group'),
          items: widget._fields.getOptions('hoist-group'),
          onChanged: (value) => setState(() => widget._fields.update('hoist-group', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Type of lifted load'.loc,
          value: widget._fields.getOptionsValue('type-of-lifted-load'),
          items: widget._fields.getOptions('type-of-lifted-load'),
          onChanged: (value) => setState(() => widget._fields.update('type-of-lifted-load', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
      ],
    );
  }
}
