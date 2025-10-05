import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/number_form_field.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/drop_down_form_field.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/text_form_field.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Part of [SecondPage] - the bridge running mechanism parameters.
class BridgeRunningMechanismPage extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// The body of the general crane parameters.
  ///
  /// [fields] - temporary example of ResultPage content
  const BridgeRunningMechanismPage({
    super.key,
    required SgocInit fields,
  })  : _fields = fields;
  //
  @override
  State<BridgeRunningMechanismPage> createState() => _BridgeRunningMechanismPageState();
}
//
class _BridgeRunningMechanismPageState extends State<BridgeRunningMechanismPage> {
  @override
  Widget build(BuildContext context) {
    final uiPadding = const Setting('ui-padding').toDouble;
    final uiPaddingDouble = const Setting('ui-paddingDouble').toDouble;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: uiPadding,
      children: [
        SizedBox(height: uiPaddingDouble),
        Text('Bridge running mechanism'.loc),
        NumberFormFieldWidget(
          label: 'Rated traveling bridge speed, m/min'.loc,
          value: widget._fields.get('rated-traveling-bridge-speed'),
          onChanged: (value) => setState(() => widget._fields.update('rated-traveling-bridge-speed', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Slow traveling bridge speed, m/min'.loc,
          value: widget._fields.get('slow-traveling-bridge-speed'),
          onChanged: (value) => setState(() => widget._fields.update('slow-traveling-bridge-speed', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        DropDownFormFieldWidget(
          label: 'Bridge group (GOST 34017-2016)'.loc,
          value: widget._fields.getOptionsValue('bridge-group'),
          items: widget._fields.getOptions('bridge-group'),
          onChanged: (value) => setState(() => widget._fields.update('bridge-group', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Bridge movement duration'.loc,
          value: widget._fields.getOptionsValue('bridge-movement-duration'),
          items: widget._fields.getOptions('bridge-movement-duration'),
          onChanged: (value) => setState(() => widget._fields.update('bridge-movement-duration', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        TextFormFieldWidget(
          label: 'Drive marking'.loc,
          value: widget._fields.get('drive-marking'),
          onChanged: (value) => setState(() => widget._fields.update('drive-marking', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        TextFormFieldWidget(
          label: 'Drive manufacturer'.loc,
          value: widget._fields.get('drive-manufacturer'),
          onChanged: (value) => setState(() => widget._fields.update('drive-manufacturer', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        TextFormFieldWidget(
          label: 'Electrical equipment protection degree bridge'.loc,
          value: widget._fields.get('electrical-equipment-protection-degree-bridge'),
          onChanged: (value) => setState(() => widget._fields.update('electrical-equipment-protection-degree-bridge', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        NumberFormFieldWidget(
          label: 'Number of bridge motors'.loc,
          value: widget._fields.get('number-bridge-motors'),
          onChanged: (value) => setState(() => widget._fields.update('number-bridge-motors', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Rated power bridge motor, kW'.loc,
          value: widget._fields.get('rated-power-bridge-motor'),
          onChanged: (value) => setState(() => widget._fields.update('rated-power-bridge-motor', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Rated current bridge motor, A'.loc,
          value: widget._fields.get('rated-current-bridge-motor'),
          onChanged: (value) => setState(() => widget._fields.update('rated-current-bridge-motor', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        DropDownFormFieldWidget(
          label: 'Control method bridge'.loc,
          value: widget._fields.getOptionsValue('control-method-bridge'),
          items: widget._fields.getOptions('control-method-bridge'),
          onChanged: (value) => setState(() => widget._fields.update('control-method-bridge', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Wheel assembly'.loc,
          value: widget._fields.getOptionsValue('wheel-assembly'),
          items: widget._fields.getOptions('wheel-assembly'),
          onChanged: (value) => setState(() => widget._fields.update('wheel-assembly', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        TextFormFieldWidget(
          label: 'Crane rail'.loc,
          value: widget._fields.get('crane-rail'),
          onChanged: (value) => setState(() => widget._fields.update('crane-rail', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Manual brake release bridge'.loc,
          value: widget._fields.getOptionsValue('manual-brake-release-bridge'),
          items: widget._fields.getOptions('manual-brake-release-bridge'),
          onChanged: (value) => setState(() => widget._fields.update('manual-brake-release-bridge', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Limit buffer bridge'.loc,
          value: widget._fields.getOptionsValue('limit-buffer-bridge'),
          items: widget._fields.getOptions('limit-buffer-bridge'),
          onChanged: (value) => setState(() => widget._fields.update('limit-buffer-bridge', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
      ],
    );
  }
}
