import 'package:cdt_client/domain/validation/only_double_validation_case.dart';
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
  final Map<int, dynamic> data;
  final Function() formValidator;
  ///
  /// The body of the general crane parametrs.
  ///
  /// [users] - all stored users
  /// [data] - temprorary example of InitialPage content
  /// [formValidator] - function for cheking the whole form validity
  const GeneralCraneParametersPartPage({
    super.key,
    //required this.users,
    required this.data,
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
          value: widget.data[42],
          items: widget.data[43],
          onChanged: (value) => setState(() => widget.data[42] = value),
          formValidator: widget.formValidator,
        ),
        DropDownMenuFormFieldWidget(
          label: 'Взрыво-пожаробезопасное исполнение',
          value: widget.data[44],
          items: widget.data[45],
          onChanged: (value) => setState(() => widget.data[44] = value),
          formValidator: widget.formValidator,
        ),
        TextFormFieldWidget(
          label: 'Маркировка пожаро-/взрывоопасной среды',
          value: widget.data[46],
          onChanged: (value) => setState(() => widget.data[46] = value),
          formValidator: widget.formValidator,
        ),
        DropDownMenuFormFieldWidget(
          label: 'Режим работы крана (ГОСТ 34017-2016)',
          value: widget.data[47],
          items: widget.data[48],
          onChanged: (value) => setState(() => widget.data[47] = value),
          formValidator: widget.formValidator,
        ),
        DropDownMenuFormFieldWidget(
          label: 'Климатическое исполнение',
          value: widget.data[49],
          items: widget.data[50],
          onChanged: (value) => setState(() => widget.data[49] = value),
          formValidator: widget.formValidator,
        ),
        DropDownMenuFormFieldWidget(
          label: 'Ветровой район',
          value: widget.data[51],
          items: widget.data[52],
          onChanged: (value) => setState(() => widget.data[51] = value),
          formValidator: widget.formValidator,
        ),
        NumberFormFieldWidget(
          label: 'Максимальная температура эксплуатации, °C',
          value: widget.data[53],
          onChanged: (value) => setState(() => widget.data[53] = value),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Минимальная температура эксплуатации, °C',
          value: widget.data[54],
          onChanged: (value) => setState(() => widget.data[54] = value),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        DropDownMenuFormFieldWidget(
          label: 'Основной вид управления',
          value: widget.data[55],
          items: widget.data[56],
          onChanged: (value) => setState(() => widget.data[55] = value),
          formValidator: widget.formValidator,
        ),
        DropDownMenuFormFieldWidget(
          label: 'Место расположения кабины',
          value: widget.data[57],
          items: widget.data[58],
          onChanged: (value) => setState(() => widget.data[57] = value),
          formValidator: widget.formValidator,
        ),
        NumberFormFieldWidget(
          label: 'Количество грузовых тележек, шт',
          value: widget.data[59],
          onChanged: (value) => setState(() => widget.data[59] = value),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Максимальная масса крана, т',
          value: widget.data[60],
          onChanged: (value) => setState(() => widget.data[60] = value),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Допускаемое давление колеса, кН',
          value: widget.data[61],
          onChanged: (value) => setState(() => widget.data[61] = value),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
