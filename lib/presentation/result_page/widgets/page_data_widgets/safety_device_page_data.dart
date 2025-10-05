import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/drop_down_form_field.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Part of [SecondPage] - the safety devices parameters.
class SafetyDevicesPage extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// The body of the general crane parameters.
  ///
  /// [fields] - temporary example of ResultPage content
  const SafetyDevicesPage({
    super.key,
    required SgocInit fields,
  })  : _fields = fields;
  //
  @override
  State<SafetyDevicesPage> createState() => _SafetyDevicesPageState();
}
//
class _SafetyDevicesPageState extends State<SafetyDevicesPage> {
  @override
  Widget build(BuildContext context) {
    final uiPadding = const Setting('ui-padding').toDouble;
    final uiPaddingDouble = const Setting('ui-paddingDouble').toDouble;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: uiPadding,
      children: [
        SizedBox(height: uiPaddingDouble),
        Text('Safety devices'.loc),
        DropDownFormFieldWidget(
          label: 'Hoist limit switch'.loc,
          value: widget._fields.getOptionsValue('hoist-limit-switch'),
          items: widget._fields.getOptions('hoist-limit-switch'),
          onChanged: (value) => setState(() => widget._fields.update('hoist-limit-switch', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Load limit device'.loc,
          value: widget._fields.getOptionsValue('load-limit-device'),
          items: widget._fields.getOptions('load-limit-device'),
          onChanged: (value) => setState(() => widget._fields.update('load-limit-device', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Trolley travel limit switch'.loc,
          value: widget._fields.getOptionsValue('trolley-travel-limit-switch'),
          items: widget._fields.getOptions('trolley-travel-limit-switch'),
          onChanged: (value) => setState(() => widget._fields.update('trolley-travel-limit-switch', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Bridge travel limit switch'.loc,
          value: widget._fields.getOptionsValue('bridge-travel-limit-switch'),
          items: widget._fields.getOptions('bridge-travel-limit-switch'),
          onChanged: (value) => setState(() => widget._fields.update('bridge-travel-limit-switch', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Light signal'.loc,
          value: widget._fields.getOptionsValue('light-signal'),
          items: widget._fields.getOptions('light-signal'),
          onChanged: (value) => setState(() => widget._fields.update('light-signal', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Sound signal'.loc,
          value: widget._fields.getOptionsValue('sound-signal'),
          items: widget._fields.getOptions('sound-signal'),
          onChanged: (value) => setState(() => widget._fields.update('sound-signal', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Anti-collision sensor'.loc,
          value: widget._fields.getOptionsValue('anti-collision-sensor'),
          items: widget._fields.getOptions('anti-collision-sensor'),
          onChanged: (value) => setState(() => widget._fields.update('anti-collision-sensor', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Anemometer'.loc,
          value: widget._fields.getOptionsValue('anemometer'),
          items: widget._fields.getOptions('anemometer'),
          onChanged: (value) => setState(() => widget._fields.update('anemometer', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
      ],
    );
  }
}
