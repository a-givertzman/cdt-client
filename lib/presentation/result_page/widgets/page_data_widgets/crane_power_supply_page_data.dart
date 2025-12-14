import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/drop_down_form_field.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/text_form_field.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Part of [ThirdPage].
/// The body of the general crane parameters.
class CranePowerSupplyPage extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// Part of [ThirdPage].
  /// The body of the general crane parameters.
  ///
  /// [fields] - temporary example of InitialPage content
  const CranePowerSupplyPage({
    super.key,
    required SgocInit fields,
  })  : _fields = fields;
  //
  @override
  State<CranePowerSupplyPage> createState() => _CranePowerSupplyPageState();
}
//
class _CranePowerSupplyPageState extends State<CranePowerSupplyPage> {
  @override
  Widget build(BuildContext context) {
    final uiPadding = const Setting('ui-padding').toDouble;
    final uiPaddingDouble = const Setting('ui-paddingDouble').toDouble;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: uiPadding,
      children: [
        SizedBox(height: uiPaddingDouble),
        Text('Crane power supply'.loc),
        DropDownFormFieldWidget(
          label: 'Crane power supply type'.loc,
          value: widget._fields.getOptionsValue('crane-power-supply-type'),
          items: widget._fields.getOptions('crane-power-supply-type'),
          onChanged: (value) => setState(() => widget._fields.update('crane-power-supply-type', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        TextFormFieldWidget(
          label: 'Crane guide rail type'.loc,
          value: widget._fields.get('crane-guide-rail-type'),
          onChanged: (value) => setState(() => widget._fields.update('crane-guide-rail-type', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
      ],
    );
  }
}
