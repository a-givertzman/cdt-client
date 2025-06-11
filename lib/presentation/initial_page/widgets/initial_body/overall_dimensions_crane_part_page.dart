import 'package:cdt_client/infrostructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/initial_page/widgets/number_form_field.dart';
// ignore: implementation_imports
import 'package:hmi_widgets/src/core/validation/cases/only_digits_validation_case.dart';
// ignore: implementation_imports
import 'package:hmi_widgets/src/core/validation/validator.dart';

///
/// Part of [InitialPage] - the overall dimensions of the crane.
/// Seven fields.
class OverallDimensionsCranePartPage extends StatefulWidget {
  //final AppUserStacked users;
  final SgocInit fields;
  final Function(String?) formValidator;
  ///
  /// The body of the trolley running mechanism.
  ///
  /// [users] - all stored users
  /// [fields] - temprorary example of InitialPage content
  /// [formValidator] - function for cheking the whole form validity
  const OverallDimensionsCranePartPage({
    super.key,
    //required this.users,
    required this.fields,
    required this.formValidator,
  });
  @override
  State<OverallDimensionsCranePartPage> createState() => _OverallDimensionsCranePartPageState();
}
//
class _OverallDimensionsCranePartPageState extends State<OverallDimensionsCranePartPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Габаритные размеры крана',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        NumberFormFieldWidget(
          label: 'Пролёт крана, м',
          value: widget.fields.get('span'),
          onChanged: (value) => setState(() => widget.fields.update('span', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDigitsValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Приближение к левому краю (l1), м',
          value: widget.fields.get('left-edge-approach-lifting-device'),
          onChanged: (value) => setState(() => widget.fields.update('left-edge-approach-lifting-device', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDigitsValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Приближение к правому краю (l2), м',
          value: widget.fields.get('right-edge-approach-lifting-device'),
          onChanged: (value) => setState(() => widget.fields.update('right-edge-approach-lifting-device', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDigitsValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Вертикальное расстояние до грузозахватного органа, м',
          value: widget.fields.get('vertical-distance-from-crane-rail-to-lifting-device'),
          onChanged: (value) => setState(() => widget.fields.update('vertical-distance-from-crane-rail-to-lifting-device', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDigitsValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Макс. расстояние до верхней точки крана, м',
          value: widget.fields.get('maximum-vertical-distance-from-the-crane-rail-to-the-top-of-the-crane'),
          onChanged: (value) => setState(() => widget.fields.update('maximum-vertical-distance-from-the-crane-rail-to-the-top-of-the-crane', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDigitsValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Максимальная база крана, м',
          value: widget.fields.get('max-crane-base'),
          onChanged: (value) => setState(() => widget.fields.update('max-crane-base', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDigitsValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Максимальная ширина крана, м',
          value: widget.fields.get('max-width-crane'),
          onChanged: (value) => setState(() => widget.fields.update('max-width-crane', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDigitsValidationCase()]),
        ),
      ],
    );
  }
}
