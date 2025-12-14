import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/text_form_field.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Part of [ThirdPage].
/// The body of the general crane parameters
class CraneMetalStructurePage extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// Part of [ThirdPage].
  /// The body of the general crane parameters.
  ///
  /// [fields] - temporary example of InitialPage content
  const CraneMetalStructurePage({
    super.key,
    required SgocInit fields,
  })  : _fields = fields;
  //
  @override
  State<CraneMetalStructurePage> createState() => _CraneMetalStructurePageState();
}
//
class _CraneMetalStructurePageState extends State<CraneMetalStructurePage> {
  @override
  Widget build(BuildContext context) {
    final uiPadding = const Setting('ui-padding').toDouble;
    final uiPaddingDouble = const Setting('ui-paddingDouble').toDouble;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: uiPadding,
      children: [
        SizedBox(height: uiPaddingDouble),
        Text('Crane metal structure'.loc),
        TextFormFieldWidget(
          label: 'Main beam profile'.loc,
          value: widget._fields.get('main-beam-profile'),
          onChanged: (value) => setState(() => widget._fields.update('main-beam-profile', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        TextFormFieldWidget(
          label: 'End beam name'.loc,
          value: widget._fields.get('end-beam-name'),
          onChanged: (value) => setState(() => widget._fields.update('end-beam-name', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
      ],
    );
  }
}
