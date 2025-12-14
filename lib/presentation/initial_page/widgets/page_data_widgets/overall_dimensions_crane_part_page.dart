import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/number_form_field.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_core/hmi_core_translate.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Part of [SecondPage].
/// The body of the trolley running mechanism.
/// Seven fields.
class OverallDimensionsCranePartPage extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// Part of [SecondPage].
  /// The body of the trolley running mechanism.
  /// Seven fields.
  ///
  /// [fields] - temporary example of InitialPage content
  const OverallDimensionsCranePartPage({
    super.key,
    required SgocInit fields,
  })  : _fields = fields;
  @override
  State<OverallDimensionsCranePartPage> createState() => _OverallDimensionsCranePartPageState();
}
//
class _OverallDimensionsCranePartPageState extends State<OverallDimensionsCranePartPage> {
  @override
  Widget build(BuildContext context) {
    final uiPadding = const Setting('ui-padding').toDouble;
    final uiPaddingDouble = const Setting('ui-paddingDouble').toDouble;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: uiPadding,
      children: [
        SizedBox(height: uiPaddingDouble),
        Text('Overall dimensions of the crane'.loc),
        NumberFormFieldWidget(
          label: 'Span, m'.loc,
          value: widget._fields.get('span'),
          onChanged: (value) => setState(() => widget._fields.update('span', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Left edge approach lifting device (l1), m'.loc,
          value: widget._fields.get('left-edge-approach-lifting-device'),
          onChanged: (value) => setState(() => widget._fields.update('left-edge-approach-lifting-device', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Right edge approach lifting device (l2), m'.loc,
          value: widget._fields.get('right-edge-approach-lifting-device'),
          onChanged: (value) => setState(() => widget._fields.update('right-edge-approach-lifting-device', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Vertical distance from crane rail to lifting device, m'.loc,
          value: widget._fields.get('vertical-distance-from-crane-rail-to-lifting-device'),
          onChanged: (value) => setState(() => widget._fields.update('vertical-distance-from-crane-rail-to-lifting-device', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Maximum vertical distance from the crane rail to the top of the crane, m'.loc,
          value: widget._fields.get('maximum-vertical-distance-from-the-crane-rail-to-the-top-of-the-crane'),
          onChanged: (value) => setState(() => widget._fields.update('maximum-vertical-distance-from-the-crane-rail-to-the-top-of-the-crane', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Max crane base, m'.loc,
          value: widget._fields.get('max-crane-base'),
          onChanged: (value) => setState(() => widget._fields.update('max-crane-base', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Max width crane, m'.loc,
          value: widget._fields.get('max-width-crane'),
          onChanged: (value) => setState(() => widget._fields.update('max-width-crane', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
      ],
    );
  }
}
