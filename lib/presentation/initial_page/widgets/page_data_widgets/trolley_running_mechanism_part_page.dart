import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/number_form_field.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/drop_down_form_field.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_core/hmi_core_translate.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Part of [FirstPage] - the trolley running mechanism.
/// FIve fields.
class TrolleyRunningMechanismPartPage extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// The body of the trolley running mechanism.
  ///
  /// [fields] - temporary example of InitialPage content
  const TrolleyRunningMechanismPartPage({
    super.key,
    required SgocInit fields,
  })  : _fields = fields;
  @override
  State<TrolleyRunningMechanismPartPage> createState() => _TrolleyRunningMechanismPartPageState();
}
//
class _TrolleyRunningMechanismPartPageState extends State<TrolleyRunningMechanismPartPage> {
  @override
  Widget build(BuildContext context) {
    final uiPadding = const Setting('ui-padding').toDouble;
    final uiPaddingDouble = const Setting('ui-paddingDouble').toDouble;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: uiPadding,
      children: [
        SizedBox(height: uiPaddingDouble),
        Text('Parameters of the hoist travel mechanism'.loc),
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
          label: 'Trolley group'.loc,
          value: widget._fields.getOptionsValue('trolley-group'),
          items: widget._fields.getOptions('trolley-group'),
          onChanged: (value) => setState(() => widget._fields.update('trolley-group', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Trolley control system'.loc,
          value: widget._fields.getOptionsValue('trolley-control-system'),
          items: widget._fields.getOptions('trolley-control-system'),
          onChanged: (value) => setState(() => widget._fields.update('trolley-control-system', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Trolley power system'.loc,
          value: widget._fields.getOptionsValue('trolley-power-system'),
          items: widget._fields.getOptions('trolley-power-system'),
          onChanged: (value) => setState(() => widget._fields.update('trolley-power-system', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
      ],
    );
  }
}
