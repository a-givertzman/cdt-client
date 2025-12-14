import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/number_form_field.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/drop_down_form_field.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/text_form_field.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Part of [FirstPage].
/// The body of the general crane parameters.
class HoistMechanismPage extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// Part of [FirstPage].
  /// The body of the general crane parameters.
  ///
  /// [fields] - temporary example of ResultPage content
  const HoistMechanismPage({
    super.key,
    required SgocInit fields,
  })  : _fields = fields;
  //
  @override
  State<HoistMechanismPage> createState() => _HoistMechanismPageState();
}
//
class _HoistMechanismPageState extends State<HoistMechanismPage> {
  @override
  Widget build(BuildContext context) {
    final uiPadding = const Setting('ui-padding').toDouble;
    final uiPaddingDouble = const Setting('ui-paddingDouble').toDouble;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: uiPadding,
      children: [
        SizedBox(height: uiPaddingDouble),
        Text('Hoist mechanism'.loc),
        TextFormFieldWidget(
          label: 'Hoist name'.loc,
          value: widget._fields.get('hoist-name'),
          onChanged: (value) => setState(() => widget._fields.update('hoist-name', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        TextFormFieldWidget(
          label: 'Hoist manufacturer'.loc,
          value: widget._fields.get('hoist-manufacturer'),
          onChanged: (value) => setState(() => widget._fields.update('hoist-manufacturer', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
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
        NumberFormFieldWidget(
          label: 'Max lifting height, m'.loc,
          value: widget._fields.get('max-lifting-height'),
          onChanged: (value) => setState(() => widget._fields.update('max-lifting-height', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Hoist tackle'.loc,
          value: widget._fields.get('hoist-tackle'),
          onChanged: (value) => setState(() => widget._fields.update('hoist-tackle', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
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
          label: 'Hoist group (GOST 34017-2016)'.loc,
          value: widget._fields.getOptionsValue('hoist-group'),
          items: widget._fields.getOptions('hoist-group'),
          onChanged: (value) => setState(() => widget._fields.update('hoist-group', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        TextFormFieldWidget(
          label: 'Electrical equipment protection degree'.loc,
          value: widget._fields.get('electrical-equipment-protection-degree'),
          onChanged: (value) => setState(() => widget._fields.update('electrical-equipment-protection-degree', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        NumberFormFieldWidget(
          label: 'Number of hoist motors'.loc,
          value: widget._fields.get('number-hoist-motors'),
          onChanged: (value) => setState(() => widget._fields.update('number-hoist-motors', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Rated power hoist motor, kW'.loc,
          value: widget._fields.get('rated-power-hoist-motor'),
          onChanged: (value) => setState(() => widget._fields.update('rated-power-hoist-motor', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Rated current hoist motor, A'.loc,
          value: widget._fields.get('rated-current-hoist-motor'),
          onChanged: (value) => setState(() => widget._fields.update('rated-current-hoist-motor', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        DropDownFormFieldWidget(
          label: 'Control method hoist'.loc,
          value: widget._fields.getOptionsValue('control-method-hoist'),
          items: widget._fields.getOptions('control-method-hoist'),
          onChanged: (value) => setState(() => widget._fields.update('control-method-hoist', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Manual brake release hoist'.loc,
          value: widget._fields.getOptionsValue('manual-brake-release-hoist'),
          items: widget._fields.getOptions('manual-brake-release-hoist'),
          onChanged: (value) => setState(() => widget._fields.update('manual-brake-release-hoist', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
      ],
    );
  }
}
