import 'package:cdt_client/domain/validation/only_double_validation_case.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/initial_page/widgets/number_form_field.dart';
import 'package:cdt_client/presentation/initial_page/widgets/drop_down_menu_form_field.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// Part of [InitialPage] - hoist.
/// First ten fields.
class HoistPartPage extends StatefulWidget {
  //final AppUserStacked users;
  final Map<int, dynamic> data;
  final Function() formValidator;
  ///
  /// The body of hoist.
  ///
  /// [users] - all stored users
  /// [data] - temprorary example of InitialPage content
  /// [formValidator] - function for cheking the whole form validity
  const HoistPartPage({
    super.key,
    //required this.users,
    required this.data,
    required this.formValidator,
  });
  @override
  State<HoistPartPage> createState() => _HoistPartPageState();
}
//
class _HoistPartPageState extends State<HoistPartPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Параметры механизма подъёма',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        NumberFormFieldWidget(
          label: 'Грузоподъёмность механизма, т',
          value: widget.data[0],
          onChanged: (value) => setState(() => widget.data[0] = value),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Высота подъёма механизма, м',
          value: widget.data[1],
          onChanged: (value) => setState(() => widget.data[1] = value),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        DropDownMenuFormFieldWidget(
          label: 'Тип грузозахватного органа',
          value: widget.data[2],
          items: widget.data[3],
          onChanged: (value) => setState(() => widget.data[2] = value),
          formValidator: widget.formValidator,
        ),
        NumberFormFieldWidget(
          label: 'Номинальная скорость подъёма, м/мин',
          value: widget.data[4],
          onChanged: (value) => setState(() => widget.data[4] = value),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        NumberFormFieldWidget(
          label: 'Замедленная скорость подъёма, м/мин',
          value: widget.data[5],
          onChanged: (value) => setState(() => widget.data[5] = value),
          formValidator: widget.formValidator,
          validator: Validator(cases: [OnlyDoubleValidationCase()]),
        ),
        DropDownMenuFormFieldWidget(
          label: 'Режим работы механизма подъёма',
          value: widget.data[6],
          items: widget.data[7],
          onChanged: (value) => setState(() => widget.data[6] = value),
          formValidator: widget.formValidator,
        ),
        DropDownMenuFormFieldWidget(
          label: 'Продолжительность включения (ПВ)',
          value: widget.data[8],
          items: widget.data[9],
          onChanged: (value) => setState(() => widget.data[8] = value),
          formValidator: widget.formValidator,
        ),
        DropDownMenuFormFieldWidget(
          label: 'Система управления приводом',
          value: widget.data[10],
          items: widget.data[11],
          onChanged: (value) => setState(() => widget.data[10] = value),
          formValidator: widget.formValidator,
        ),
        DropDownMenuFormFieldWidget(
          label: 'Тип привода механизма подъёма',
          value: widget.data[12],
          items: widget.data[13],
          onChanged: (value) => setState(() => widget.data[12] = value),
          formValidator: widget.formValidator,
        ),
        DropDownMenuFormFieldWidget(
          label: 'Тип поднимаемого груза',
          value: widget.data[14],
          items: widget.data[15],
          onChanged: (value) => setState(() => widget.data[14] = value),
          formValidator: widget.formValidator,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
