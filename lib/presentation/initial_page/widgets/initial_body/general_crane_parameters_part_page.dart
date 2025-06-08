import 'package:cdt_client/domain/validation/only_double_validation_case.dart';
import 'package:cdt_client/infrostructure/bc/sgoc_init.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/initial_page/widgets/number_form_field.dart';
import 'package:cdt_client/presentation/initial_page/widgets/drop_down_menu_form_field.dart';
import 'package:cdt_client/presentation/initial_page/widgets/text_form_field.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Part of [InitialPage] - the general crane parametrs.
/// Thirteen fields.
class GeneralCraneParametersPartPage extends StatefulWidget {
  //final AppUserStacked users;
  final SgocInit fields;
  final Function(String?) formValidator;
  ///
  /// The body of the general crane parametrs.
  ///
  /// [users] - all stored users
  /// [fields] - temprorary example of InitialPage content
  /// [formValidator] - function for cheking the whole form validity
  const GeneralCraneParametersPartPage({
    super.key,
    //required this.users,
    required this.fields,
    required this.formValidator,
  });
  @override
  State<GeneralCraneParametersPartPage> createState() => _GeneralCraneParametersPartPageState();
}
//
// GeneralCraneParametersPartPage.dart
class _GeneralCraneParametersPartPageState extends State<GeneralCraneParametersPartPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Общие параметры крана',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        DropDownMenuFormFieldWidget(
          label: 'Исполнение крана',
          value: widget.fields.getOptionsValue('crane-purpose'),
          items: widget.fields.getOptions('crane-purpose'),
          onChanged: (value) => setState(() => widget.fields.update('crane-purpose', value)),
          formValidator: widget.formValidator,
        ),
        DropDownMenuFormFieldWidget(
          label: 'Взрыво-пожаробезопасное исполнение',
          value: widget.fields.getOptionsValue('explosion-fire-safe-crane-purpose'),
          items: widget.fields.getOptions('explosion-fire-safe-crane-purpose'),
          onChanged: (value) => setState(() => widget.fields.update('explosion-fire-safe-crane-purpose', value)),
          formValidator: widget.formValidator,
        ),
        TextFormFieldWidget(
          label: 'Маркировка пожаро-/взрывоопасной среды',
          value: widget.fields.get('marking-of-fire-explosion-hazardous-operating-environment'),
          onChanged: (value) => setState(() => widget.fields.update('marking-of-fire-explosion-hazardous-operating-environment', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [MinLengthValidationCase(1)]),
        ),
        DropDownMenuFormFieldWidget(
          label: 'Режим работы крана (ГОСТ 34017-2016)',
          value: widget.fields.getOptionsValue('duty-class'),
          items: widget.fields.getOptions('duty-class'),
          onChanged: (value) => setState(() => widget.fields.update('duty-class', value)),
          formValidator: widget.formValidator,
        ),
        DropDownMenuFormFieldWidget(
          label: 'Климатическое исполнение',
          value: widget.fields.getOptionsValue('climatic-design-and-placement-category-crane'),
          items: widget.fields.getOptions('climatic-design-and-placement-category-crane'),
          onChanged: (value) => setState(() => widget.fields.update('climatic-design-and-placement-category-crane', value)),
          formValidator: widget.formValidator,
        ),
        DropDownMenuFormFieldWidget(
          label: 'Ветровой район',
          value: widget.fields.getOptionsValue('crane-wind-area'),
          items: widget.fields.getOptions('crane-wind-area'),
          onChanged: (value) => setState(() => widget.fields.update('crane-wind-area', value)),
          formValidator: widget.formValidator,
        ),
        NumberFormFieldWidget(
          label: 'Максимальная температура эксплуатации, °C',
          value: widget.fields.get('max-use-temperature'),
          onChanged: (value) => setState(() => widget.fields.update('max-use-temperature', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Минимальная температура эксплуатации, °C',
          value: widget.fields.get('min-use-temperature'),
          onChanged: (value) => setState(() => widget.fields.update('min-use-temperature', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        DropDownMenuFormFieldWidget(
          label: 'Основной вид управления',
          value: widget.fields.getOptionsValue('basic-crane-control'),
          items: widget.fields.getOptions('basic-crane-control'),
          onChanged: (value) => setState(() => widget.fields.update('basic-crane-control', value)),
          formValidator: widget.formValidator,
        ),
        DropDownMenuFormFieldWidget(
          label: 'Место расположения кабины',
          value: widget.fields.getOptionsValue('cab-location'),
          items: widget.fields.getOptions('cab-location'),
          onChanged: (value) => setState(() => widget.fields.update('cab-location', value)),
          formValidator: widget.formValidator,
        ),
        NumberFormFieldWidget(
          label: 'Количество грузовых тележек, шт',
          value: widget.fields.get('identical-hoists-volume'),
          onChanged: (value) => setState(() => widget.fields.update('identical-hoists-volume', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Максимальная масса крана, т',
          value: widget.fields.get('max-crane-mass'),
          onChanged: (value) => setState(() => widget.fields.update('max-crane-mass', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Допускаемое давление колеса, кН',
          value: widget.fields.get('max-wheel-load'),
          onChanged: (value) => setState(() => widget.fields.update('max-wheel-load', value)),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
