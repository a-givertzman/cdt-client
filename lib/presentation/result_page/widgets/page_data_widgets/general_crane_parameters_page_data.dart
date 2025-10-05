import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/number_form_field.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/drop_down_form_field.dart';
import 'package:cdt_client/presentation/core/widgets/form_fields/text_form_field.dart';
import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Part of [FirstPage] - the general crane parameters.
class GeneralCraneParametersPage extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// The body of the general crane parameters.
  ///
  /// [fields] - temporary example of ResultPage content
  const GeneralCraneParametersPage({
    super.key,
    required SgocInit fields,
  })  : _fields = fields;
  @override
  State<GeneralCraneParametersPage> createState() => _GeneralCraneParametersPageState();
}
//
class _GeneralCraneParametersPageState extends State<GeneralCraneParametersPage> {
  @override
  Widget build(BuildContext context) {
    final uiPadding = const Setting('ui-padding').toDouble;
    final uiPaddingDouble = const Setting('ui-paddingDouble').toDouble;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: uiPadding,
      children: [
        SizedBox(height: uiPaddingDouble),
        Text('General crane parameters'.loc),
        TextFormFieldWidget(
          label: 'Crane index'.loc,
          value: widget._fields.get('crane-index'),
          onChanged: (value) => setState(() => widget._fields.update('crane-index', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        TextFormFieldWidget(
          label: 'Full crane type'.loc,
          value: widget._fields.get('full-crane-type'),
          onChanged: (value) => setState(() => widget._fields.update('full-crane-type', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        NumberFormFieldWidget(
          label: 'Span, m'.loc,
          value: widget._fields.get('span'),
          onChanged: (value) => setState(() => widget._fields.update('span', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
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
        NumberFormFieldWidget(
          label: 'Supply voltage, V'.loc,
          value: widget._fields.get('supply-voltage'),
          onChanged: (value) => setState(() => widget._fields.update('supply-voltage', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Supply frequency, Hz'.loc,
          value: widget._fields.get('supply-frequency'),
          onChanged: (value) => setState(() => widget._fields.update('supply-frequency', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        TextFormFieldWidget(
          label: 'Operating temperature, °C'.loc,
          value: widget._fields.get('operating-temperature'),
          onChanged: (value) => setState(() => widget._fields.update('operating-temperature', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        NumberFormFieldWidget(
          label: 'Seismicity MSK-64'.loc,
          value: widget._fields.get('seismicity-msk-64'),
          onChanged: (value) => setState(() => widget._fields.update('seismicity-msk-64', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        DropDownFormFieldWidget(
          label: 'Type of lifted load'.loc,
          value: widget._fields.getOptionsValue('type-of-lifted-load'),
          items: widget._fields.getOptions('type-of-lifted-load'),
          onChanged: (value) => setState(() => widget._fields.update('type-of-lifted-load', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Basic crane control'.loc,
          value: widget._fields.getOptionsValue('basic-crane-control'),
          items: widget._fields.getOptions('basic-crane-control'),
          onChanged: (value) => setState(() => widget._fields.update('basic-crane-control', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownFormFieldWidget(
          label: 'Control location'.loc,
          value: widget._fields.getOptionsValue('control-location'),
          items: widget._fields.getOptions('control-location'),
          onChanged: (value) => setState(() => widget._fields.update('control-location', value)),
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        NumberFormFieldWidget(
          label: 'Crane weight, kg'.loc,
          value: widget._fields.get('crane-weight'),
          onChanged: (value) => setState(() => widget._fields.update('crane-weight', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Total rated power drives, kW'.loc,
          value: widget._fields.get('total-rated-power-drives'),
          onChanged: (value) => setState(() => widget._fields.update('total-rated-power-drives', value)),
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
      ],
    );
  }
}
