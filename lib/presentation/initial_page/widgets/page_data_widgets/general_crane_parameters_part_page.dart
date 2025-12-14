import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/number_form_field.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/drop_down_form_field.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/text_form_field.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Part of [SecondPage].
/// The body of the general crane parameters.
/// Thirteen fields.
class GeneralCraneParametersPartPage extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// Part of [SecondPage].
  /// The body of the general crane parameters.
  /// Thirteen fields.
  ///
  /// [fields] - temporary example of InitialPage content
  const GeneralCraneParametersPartPage({
    super.key,
    required SgocInit fields,
  })  : _fields = fields;
  @override
  State<GeneralCraneParametersPartPage> createState() => _GeneralCraneParametersPartPageState();
}
//
class _GeneralCraneParametersPartPageState extends State<GeneralCraneParametersPartPage> {
  @override
  Widget build(BuildContext context) {
    final uiPadding = const Setting('ui-padding').toDouble;
    final uiPaddingDouble = const Setting('ui-paddingDouble').toDouble;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: uiPadding,
      children: [
        SizedBox(height: uiPaddingDouble),
        Text('General parameters of the crane'.loc),
        DropDownFormFieldWidget(
          label: 'Crane purpose'.loc,
          value: widget._fields.getOptionsValue('crane-purpose'),
          items: widget._fields.getOptions('crane-purpose'),
          onChanged: (value) => setState(() => widget._fields.update('crane-purpose', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Explosion-fire-safe crane purpose'.loc,
          value: widget._fields.getOptionsValue('explosion-fire-safe-crane-purpose'),
          items: widget._fields.getOptions('explosion-fire-safe-crane-purpose'),
          onChanged: (value) => setState(() => widget._fields.update('explosion-fire-safe-crane-purpose', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        TextFormFieldWidget(
          label: 'Marking of fire-explosion hazardous operating environment'.loc,
          value: widget._fields.get('marking-of-fire-explosion-hazardous-operating-environment'),
          onChanged: (value) => setState(() => widget._fields.update('marking-of-fire-explosion-hazardous-operating-environment', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Duty class (GOST 34017-2016)'.loc,
          value: widget._fields.getOptionsValue('duty-class'),
          items: widget._fields.getOptions('duty-class'),
          onChanged: (value) => setState(() => widget._fields.update('duty-class', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Climatic design and placement category crane'.loc,
          value: widget._fields.getOptionsValue('climatic-design-and-placement-category-crane'),
          items: widget._fields.getOptions('climatic-design-and-placement-category-crane'),
          onChanged: (value) => setState(() => widget._fields.update('climatic-design-and-placement-category-crane', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Crane wind area'.loc,
          value: widget._fields.getOptionsValue('crane-wind-area'),
          items: widget._fields.getOptions('crane-wind-area'),
          onChanged: (value) => setState(() => widget._fields.update('crane-wind-area', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        NumberFormFieldWidget(
          label: 'Max use temperature, °C'.loc,
          value: widget._fields.get('max-use-temperature'),
          onChanged: (value) => setState(() => widget._fields.update('max-use-temperature', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Min use temperature, °C'.loc,
          value: widget._fields.get('min-use-temperature'),
          onChanged: (value) => setState(() => widget._fields.update('min-use-temperature', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        DropDownFormFieldWidget(
          label: 'Basic crane control'.loc,
          value: widget._fields.getOptionsValue('basic-crane-control'),
          items: widget._fields.getOptions('basic-crane-control'),
          onChanged: (value) => setState(() => widget._fields.update('basic-crane-control', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Cab location'.loc,
          value: widget._fields.getOptionsValue('cab-location'),
          items: widget._fields.getOptions('cab-location'),
          onChanged: (value) => setState(() => widget._fields.update('cab-location', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        NumberFormFieldWidget(
          label: 'Identical hoists volume, pcs'.loc,
          value: widget._fields.get('identical-hoists-volume'),
          onChanged: (value) => setState(() => widget._fields.update('identical-hoists-volume', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Max crane mass, t'.loc,
          value: widget._fields.get('max-crane-mass'),
          onChanged: (value) => setState(() => widget._fields.update('max-crane-mass', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Max wheel load, kN'.loc,
          value: widget._fields.get('max-wheel-load'),
          onChanged: (value) => setState(() => widget._fields.update('max-wheel-load', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
      ],
    );
  }
}
