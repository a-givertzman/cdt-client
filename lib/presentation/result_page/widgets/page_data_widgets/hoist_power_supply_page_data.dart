import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/drop_down_form_field.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/text_form_field.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Part of [ThirdPage] - the hoist power supply parameters.
class HoistPowerSupplyPage extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// The body of the general crane parameters.
  ///
  /// [fields] - temporary example of ResultPage content
  const HoistPowerSupplyPage({
    super.key,
    required SgocInit fields,
  })  : _fields = fields;
  // 
  @override
  State<HoistPowerSupplyPage> createState() => _HoistPowerSupplyPageState();
}
//
class _HoistPowerSupplyPageState extends State<HoistPowerSupplyPage> {
  @override
  Widget build(BuildContext context) {
    final uiPadding = const Setting('ui-padding').toDouble;
    final uiPaddingDouble = const Setting('ui-paddingDouble').toDouble;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: uiPadding,
      children: [
        SizedBox(height: uiPaddingDouble),
        Text('Hoist power supply'.loc),
        DropDownFormFieldWidget(
          label: 'Hoist power supply type'.loc,
          value: widget._fields.getOptionsValue('hoist-power-supply-type'),
          items: widget._fields.getOptions('hoist-power-supply-type'),
          onChanged: (value) => setState(() => widget._fields.update('hoist-power-supply-type', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        TextFormFieldWidget(
          label: 'Hoist guide rail type'.loc,
          value: widget._fields.get('hoist-guide-rail-type'),
          onChanged: (value) => setState(() => widget._fields.update('hoist-guide-rail-type', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
      ],
    );
  }
}
