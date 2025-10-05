import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/text_form_field.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Part of [SecondPage] - the power equipment parameters.
class PowerEquipmentPage extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// The body of the general crane parameters.
  ///
  /// [fields] - temporary example of ResultPage content
  const PowerEquipmentPage({
    super.key,
    required SgocInit fields,
  })  : _fields = fields;
  //
  @override
  State<PowerEquipmentPage> createState() => _PowerEquipmentPageState();
}
//
class _PowerEquipmentPageState extends State<PowerEquipmentPage> {
  @override
  Widget build(BuildContext context) {
    final uiPadding = const Setting('ui-padding').toDouble;
    final uiPaddingDouble = const Setting('ui-paddingDouble').toDouble;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: uiPadding,
      children: [
        SizedBox(height: uiPaddingDouble),
        Text('Power equipment'.loc),
        TextFormFieldWidget(
          label: 'Control cabinet'.loc,
          value: widget._fields.get('control-cabinet'),
          onChanged: (value) => setState(() => widget._fields.update('control-cabinet', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        TextFormFieldWidget(
          label: 'Control cabinet protection degree'.loc,
          value: widget._fields.get('control-cabinet-protection-degree'),
          onChanged: (value) => setState(() => widget._fields.update('control-cabinet-protection-degree', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
      ],
    );
  }
}
