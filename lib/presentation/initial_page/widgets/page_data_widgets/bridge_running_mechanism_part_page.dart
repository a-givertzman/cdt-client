import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/number_form_field.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/drop_down_form_field.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/text_form_field.dart';
import 'package:hmi_core/hmi_core_translate.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Part of [FirstPage] - the bridge running mechanism.
/// Eleven fields.
class BridgeRunningMechanismPartPage extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// The body of the bridge running mechanism.
  ///
  /// [fields] - temporary example of InitialPage content
  const BridgeRunningMechanismPartPage({
    super.key,
    //required this.users,
    required SgocInit fields,
  })  : _fields = fields;
  @override
  State<BridgeRunningMechanismPartPage> createState() => _BridgeRunningMechanismPartPageState();
}
//
class _BridgeRunningMechanismPartPageState extends State<BridgeRunningMechanismPartPage> {
  @override
  Widget build(BuildContext context) {
    final uiPadding = const Setting('ui-padding').toDouble;
    final uiPaddingDouble = const Setting('ui-paddingDouble').toDouble;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: uiPadding,
      children: [
        SizedBox(height: uiPaddingDouble),
        Text('Parameters of the crane traveling mechanism'.loc),
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
          label: 'Crane drive group'.loc,
          value: widget._fields.getOptionsValue('crane-drive-group'),
          items: widget._fields.getOptions('crane-drive-group'),
          onChanged: (value) => setState(() => widget._fields.update('crane-drive-group', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Bridge movement duration'.loc,
          value: widget._fields.getOptionsValue('bridge-movement-duration'),
          items: widget._fields.getOptions('bridge-movement-duration'),
          onChanged: (value) => setState(() => widget._fields.update('bridge-movement-duration', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Bridge control system'.loc,
          value: widget._fields.getOptionsValue('bridge-control-system'),
          items: widget._fields.getOptions('bridge-control-system'),
          onChanged: (value) => setState(() => widget._fields.update('bridge-control-system', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Crane power system'.loc,
          value: widget._fields.getOptionsValue('crane-power-system'),
          items: widget._fields.getOptions('crane-power-system'),
          onChanged: (value) => setState(() => widget._fields.update('crane-power-system', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Bridge drive type system'.loc,
          value: widget._fields.getOptionsValue('bridge-drive-type-system'),
          items: widget._fields.getOptions('bridge-drive-type-system'),
          onChanged: (value) => setState(() => widget._fields.update('bridge-drive-type-system', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Bridge drive diagram'.loc,
          value: widget._fields.getOptionsValue('bridge-drive-diagram'),
          items: widget._fields.getOptions('bridge-drive-diagram'),
          onChanged: (value) => setState(() => widget._fields.update('bridge-drive-diagram', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Bridge control system of synchronous movement'.loc,
          value: widget._fields.getOptionsValue('bridge-control-system-of-synchronous-movement'),
          items: widget._fields.getOptions('bridge-control-system-of-synchronous-movement'),
          onChanged: (value) => setState(() => widget._fields.update('bridge-control-system-of-synchronous-movement', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        TextFormFieldWidget(
          label: 'Type crane rail'.loc,
          value: widget._fields.get('type-crane-rail'),
          onChanged: (value) => setState(() => widget._fields.update('type-crane-rail', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        NumberFormFieldWidget(
          label: 'Crane rail length, m'.loc,
          value: widget._fields.get('crane-rail-length'),
          onChanged: (value) => setState(() => widget._fields.update('crane-rail-length', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
      ],
    );
  }
}
