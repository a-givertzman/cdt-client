import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/initial_page/widgets/number_form_field.dart';
///
/// Part of [InitialPage] - the overall dimensions of the crane.
/// Seven fields.
class OverallDimensionsCranePartPage extends StatefulWidget {
  //final AppUserStacked users;
  final Map<int, dynamic> data;
  final Function() formValidator;
  ///
  /// The body of the trolley running mechanism.
  ///
  /// [users] - all stored users
  /// [data] - temprorary example of InitialPage content
  /// [formValidator] - function for cheking the whole form validity
  const OverallDimensionsCranePartPage({
    super.key,
    //required this.users,
    required this.data,
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
          value: widget.data[62],
          onChanged: (value) => setState(() => widget.data[62] = value),
          formValidator: widget.formValidator,
          isInteger: false,
        ),
        NumberFormFieldWidget(
          label: 'Приближение к левому краю (l1), м',
          value: widget.data[63],
          onChanged: (value) => setState(() => widget.data[63] = value),
          formValidator: widget.formValidator,
          isInteger: false,
        ),
        NumberFormFieldWidget(
          label: 'Приближение к правому краю (l2), м',
          value: widget.data[64],
          onChanged: (value) => setState(() => widget.data[64] = value),
          formValidator: widget.formValidator,
          isInteger: false,
        ),
        NumberFormFieldWidget(
          label: 'Вертикальное расстояние до грузозахватного органа, м',
          value: widget.data[65],
          onChanged: (value) => setState(() => widget.data[65] = value),
          formValidator: widget.formValidator,
          isInteger: false,
        ),
        NumberFormFieldWidget(
          label: 'Макс. расстояние до верхней точки крана, м',
          value: widget.data[66],
          onChanged: (value) => setState(() => widget.data[66] = value),
          formValidator: widget.formValidator,
          isInteger: false,
        ),
        NumberFormFieldWidget(
          label: 'Максимальная база крана, м',
          value: widget.data[67],
          onChanged: (value) => setState(() => widget.data[67] = value),
          formValidator: widget.formValidator,
          isInteger: false,
        ),
        NumberFormFieldWidget(
          label: 'Максимальная ширина крана, м',
          value: widget.data[68],
          onChanged: (value) => setState(() => widget.data[68] = value),
          formValidator: widget.formValidator,
          isInteger: false,
        ),
      ],
    );
  }
}
