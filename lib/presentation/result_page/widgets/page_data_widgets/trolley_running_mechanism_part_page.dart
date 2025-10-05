import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/number_form_field.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/drop_down_form_field.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/text_form_field.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Part of [FirstPage] - the trolley running mechanism parameters.
class TrolleyRunningMechanismPage extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// The body of the general crane parameters.
  ///
  /// [fields] - temporary example of ResultPage content
  const TrolleyRunningMechanismPage({
    super.key,
    required SgocInit fields,
  })  : _fields = fields;
  //
  @override
  State<TrolleyRunningMechanismPage> createState() => _TrolleyRunningMechanismPageState();
}
//
class _TrolleyRunningMechanismPageState extends State<TrolleyRunningMechanismPage> {
  @override
  Widget build(BuildContext context) {
    final uiPadding = const Setting('ui-padding').toDouble;
    final uiPaddingDouble = const Setting('ui-paddingDouble').toDouble;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: uiPadding,
      children: [
        SizedBox(height: uiPaddingDouble),
        Text('Trolley running mechanism'.loc),
        NumberFormFieldWidget(
          label: 'Rated traveling trolley speed, m/min'.loc,
          value: widget._fields.get('rated-traveling-trolley-speed'),
          onChanged: (value) => setState(() => widget._fields.update('rated-traveling-trolley-speed', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Slow traveling trolley speed, m/min'.loc,
          value: widget._fields.get('slow-traveling-trolley-speed'),
          onChanged: (value) => setState(() => widget._fields.update('slow-traveling-trolley-speed', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        DropDownFormFieldWidget(
          label: 'Trolley group (GOST 34017-2016)'.loc,
          value: widget._fields.getOptionsValue('trolley-group'),
          items: widget._fields.getOptions('trolley-group'),
          onChanged: (value) => setState(() => widget._fields.update('trolley-group', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        TextFormFieldWidget(
          label: 'Electrical equipment protection degree trolley'.loc,
          value: widget._fields.get('electrical-equipment-protection-degree-trolley'),
          onChanged: (value) => setState(() => widget._fields.update('electrical-equipment-protection-degree-trolley', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        NumberFormFieldWidget(
          label: 'Number of trolley motors'.loc,
          value: widget._fields.get('number-trolley-motors'),
          onChanged: (value) => setState(() => widget._fields.update('number-trolley-motors', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Rated power trolley motor, kW'.loc,
          value: widget._fields.get('rated-power-trolley-motor'),
          onChanged: (value) => setState(() => widget._fields.update('rated-power-trolley-motor', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Rated current trolley motor, A'.loc,
          value: widget._fields.get('rated-current-trolley-motor'),
          onChanged: (value) => setState(() => widget._fields.update('rated-current-trolley-motor', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        DropDownFormFieldWidget(
          label: 'Control method trolley'.loc,
          value: widget._fields.getOptionsValue('control-method-trolley'),
          items: widget._fields.getOptions('control-method-trolley'),
          onChanged: (value) => setState(() => widget._fields.update('control-method-trolley', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Manual brake release trolley'.loc,
          value: widget._fields.getOptionsValue('manual-brake-release-trolley'),
          items: widget._fields.getOptions('manual-brake-release-trolley'),
          onChanged: (value) => setState(() => widget._fields.update('manual-brake-release-trolley', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Limit buffer trolley'.loc,
          value: widget._fields.getOptionsValue('limit-buffer-trolley'),
          items: widget._fields.getOptions('limit-buffer-trolley'),
          onChanged: (value) => setState(() => widget._fields.update('limit-buffer-trolley', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
      ],
    );
  }
}
