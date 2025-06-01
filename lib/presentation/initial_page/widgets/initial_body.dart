import 'package:flutter/material.dart';
import 'package:hmi_networking/hmi_networking.dart';
import 'package:cdt_client/presentation/core/widgets/pages_switch/form_page.dart';
///
/// [InitialPage] body widget.
/// The form provides view / edit of [initial data](https://github.com/a-givertzman/cdt-math/blob/master/design/docs/algorithm_single_ginger_overhead_crane/part01_initialization/chapter01_initialData/chapter01_initialData.md).
/// Access to edit may be restricted depends on user priveleges.
class InitialBody extends StatefulWidget {
  final Pages form;
  // final Map<Pages, Map> pageData;
  final AppUserStacked users;
  final Map<String, dynamic> data;
  final Function(bool isValid)? onValidationChanged;
  ///
  /// The body of the [InitialPage] widget.
  ///
  /// [form] - current form
  /// [data] - temprorary example of InitialPage content
  /// [pageData] - content of all forms
  /// [users] - all stored users
  /// [onValidationChanged] - callback for checking is form valid
  const InitialBody({
    super.key,
    required this.form,
    required this.data,
    //required this.pageData,
    required this.users,
    required this.onValidationChanged,
  });
  @override
  State<InitialBody> createState() => _InitialBodyState();
}
//
class _InitialBodyState extends State<InitialBody> {
  final _formKey = GlobalKey<FormState>();
  //
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Механизм подъема
              const Text(
                'Параметры механизма подъёма',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildNumberField(
                label: 'Грузоподъёмность механизма, т',
                value: widget.data["load"],
                onChanged:
                    (value) => setState(() => widget.data["load"] = value),
              ),
              _buildNumberField(
                label: 'Высота подъёма механизма, м',
                value: widget.data["lifting height"],
                onChanged:
                    (value) =>
                        setState(() => widget.data["lifting height"] = value),
              ),
              _buildDropdownField(
                label: 'Тип грузозахватного органа',
                value: widget.data["lifting device"],
                items: widget.data["lifting device options"],
                onChanged:
                    (value) =>
                        setState(() => widget.data["lifting device"] = value),
              ),
              _buildNumberField(
                label: 'Номинальная скорость подъёма, м/мин',
                value: widget.data["rated travelling hoist speed"],
                onChanged:
                    (value) => setState(
                      () => widget.data["rated travelling hoist speed"] = value,
                    ),
              ),
              _buildNumberField(
                label: 'Замедленная скорость подъёма, м/мин',
                value: widget.data["slow travelling hoist speed"],
                onChanged:
                    (value) => setState(
                      () => widget.data["slow travelling hoist speed"] = value,
                    ),
              ),
              _buildDropdownField(
                label: 'Режим работы механизма подъёма',
                value: widget.data["hoist group"],
                items: widget.data["hoist group options"],
                onChanged:
                    (value) =>
                        setState(() => widget.data["hoist group"] = value),
              ),
              _buildDropdownField(
                label: 'Продолжительность включения (ПВ)',
                value: widget.data["lifting duration"],
                items: widget.data["lifting duration options"],
                onChanged:
                    (value) =>
                        setState(() => widget.data["lifting duration"] = value),
              ),
              _buildDropdownField(
                label: 'Система управления приводом',
                value: widget.data["hoist control system"],
                items: widget.data["hoist control system options"],
                onChanged:
                    (value) => setState(
                      () => widget.data["hoist control system"] = value,
                    ),
              ),
              _buildDropdownField(
                label: 'Тип привода механизма подъёма',
                value: widget.data["lifting mechanism drive type"],
                items: widget.data["lifting mechanism drive type options"],
                onChanged:
                    (value) => setState(
                      () => widget.data["lifting mechanism drive type"] = value,
                    ),
              ),
              _buildDropdownField(
                label: 'Тип поднимаемого груза',
                value: widget.data["type of lifted load"],
                items: widget.data["type of lifted load options"],
                onChanged:
                    (value) => setState(
                      () => widget.data["type of lifted load"] = value,
                    ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Параметры механизма передвижения грузовой тали',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildNumberField(
                label: 'Номинальная скорость передвижения тали, м/мин',
                value: widget.data["rated travelling trolley speed"],
                onChanged:
                    (value) => setState(
                      () =>
                          widget.data["rated travelling trolley speed"] = value,
                    ),
              ),
              _buildNumberField(
                label: 'Замедленная скорость передвижения тали, м/мин',
                value: widget.data["slow travelling trolley speed"],
                onChanged:
                    (value) => setState(
                      () =>
                          widget.data["slow travelling trolley speed"] = value,
                    ),
              ),
              _buildDropdownField(
                label: 'Режим работы механизма передвижения тали',
                value: widget.data["trolley group"],
                items: widget.data["trolley group options"],
                onChanged:
                    (value) =>
                        setState(() => widget.data["trolley group"] = value),
              ),
              _buildDropdownField(
                label: 'Система управления приводом',
                value: widget.data["trolley control system"],
                items: widget.data["trolley control system options"],
                onChanged:
                    (value) => setState(
                      () => widget.data["trolley control system"] = value,
                    ),
              ),
              _buildDropdownField(
                label: 'Тип токоподвода к грузовой тали',
                value: widget.data["trolley power system"],
                items: widget.data["trolley power system options"],
                onChanged:
                    (value) => setState(
                      () => widget.data["trolley power system"] = value,
                    ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Параметры механизма передвижения крана',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildNumberField(
                label: 'Номинальная скорость передвижения моста, м/мин',
                value: widget.data["rated travelling bridge speed"],
                onChanged:
                    (value) => setState(
                      () =>
                          widget.data["rated travelling bridge speed"] = value,
                    ),
              ),
              _buildNumberField(
                label: 'Замедленная скорость передвижения моста, м/мин',
                value: widget.data["slow travelling bridge speed"],
                onChanged:
                    (value) => setState(
                      () => widget.data["slow travelling bridge speed"] = value,
                    ),
              ),
              _buildDropdownField(
                label: 'Режим работы механизма передвижения моста',
                value: widget.data["crane drive group"],
                items: widget.data["crane drive group options"],
                onChanged:
                    (value) => setState(
                      () => widget.data["crane drive group"] = value,
                    ),
              ),
              _buildDropdownField(
                label: 'Продолжительность включения (ПВ) механизма',
                value: widget.data["bridge movement duration"],
                items: widget.data["bridge movement duration options"],
                onChanged:
                    (value) => setState(
                      () => widget.data["bridge movement duration"] = value,
                    ),
              ),
              _buildDropdownField(
                label: 'Система управления приводом',
                value: widget.data["bridge control system"],
                items: widget.data["bridge control system options"],
                onChanged:
                    (value) => setState(
                      () => widget.data["bridge control system"] = value,
                    ),
              ),
              _buildDropdownField(
                label: 'Тип токоподвода к крану',
                value: widget.data["crane power system"],
                items: widget.data["crane power system options"],
                onChanged:
                    (value) => setState(
                      () => widget.data["crane power system"] = value,
                    ),
              ),
              _buildDropdownField(
                label: 'Тип механизма передвижения',
                value: widget.data["bridge drive type system"],
                items: widget.data["bridge drive type system options"],
                onChanged:
                    (value) => setState(
                      () => widget.data["bridge drive type system"] = value,
                    ),
              ),
              _buildDropdownField(
                label: 'Схема привода передвижения крана',
                value: widget.data["bridge drive diagram"],
                items: widget.data["bridge drive diagram options"],
                onChanged:
                    (value) => setState(
                      () => widget.data["bridge drive diagram"] = value,
                    ),
              ),
              _buildDropdownField(
                label: 'Система синхронизации механизма',
                value:
                    widget
                        .data["bridge control system of synchronous movement"],
                items:
                    widget
                        .data["bridge control system of synchronous movement options"],
                onChanged:
                    (value) => setState(
                      () =>
                          widget.data["bridge control system of synchronous movement"] =
                              value,
                    ),
              ),
              _buildTextField(
                label: 'Тип подкранового пути',
                value: widget.data["type crane rail"],
                onChanged:
                    (value) =>
                        setState(() => widget.data["type crane rail"] = value),
              ),
              _buildNumberField(
                label: 'Длина подкранового пути, м',
                value: widget.data["crane rail length"],
                onChanged:
                    (value) => setState(
                      () => widget.data["crane rail length"] = value,
                    ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Общие параметры крана',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildDropdownField(
                label: 'Исполнение крана',
                value: widget.data["crane purpose"],
                items: widget.data["crane purpose options"],
                onChanged:
                    (value) =>
                        setState(() => widget.data["crane purpose"] = value),
              ),
              _buildDropdownField(
                label: 'Взрыво-пожаробезопасное исполнение',
                value: widget.data["explosion-fire-safe crane purpose"],
                items: widget.data["explosion-fire-safe crane purpose options"],
                onChanged:
                    (value) => setState(
                      () =>
                          widget.data["explosion-fire-safe crane purpose"] =
                              value,
                    ),
              ),
              _buildTextField(
                label: 'Маркировка пожаро-/взрывоопасной среды',
                value:
                    widget
                        .data["marking of fire/explosion hazardous operating environment"],
                onChanged:
                    (value) => setState(
                      () =>
                          widget.data["marking of fire/explosion hazardous operating environment"] =
                              value,
                    ),
              ),
              _buildDropdownField(
                label: 'Режим работы крана (ГОСТ 34017-2016)',
                value: widget.data["duty class"],
                items: widget.data["duty class options"],
                onChanged:
                    (value) =>
                        setState(() => widget.data["duty class"] = value),
              ),
              _buildDropdownField(
                label: 'Климатическое исполнение',
                value:
                    widget.data["climatic design and placement category crane"],
                items:
                    widget
                        .data["climatic design and placement category crane options"],
                onChanged:
                    (value) => setState(
                      () =>
                          widget.data["climatic design and placement category crane"] =
                              value,
                    ),
              ),
              _buildDropdownField(
                label: 'Ветровой район',
                value: widget.data["crane wind area"],
                items: widget.data["crane wind area options"],
                onChanged:
                    (value) =>
                        setState(() => widget.data["crane wind area"] = value),
              ),
              _buildNumberField(
                label: 'Максимальная температура эксплуатации, °C',
                value: widget.data["max use temperature"],
                onChanged:
                    (value) => setState(
                      () => widget.data["max use temperature"] = value,
                    ),
                isInteger: true,
              ),
              _buildNumberField(
                label: 'Минимальная температура эксплуатации, °C',
                value: widget.data["min use temperature"],
                onChanged:
                    (value) => setState(
                      () => widget.data["min use temperature"] = value,
                    ),
                isInteger: true,
              ),
              _buildDropdownField(
                label: 'Основной вид управления',
                value: widget.data["basic crane control"],
                items: widget.data["basic crane control options"],
                onChanged:
                    (value) => setState(
                      () => widget.data["basic crane control"] = value,
                    ),
              ),
              _buildDropdownField(
                label: 'Место расположения кабины',
                value: widget.data["cab location"],
                items: widget.data["cab location options"],
                onChanged:
                    (value) =>
                        setState(() => widget.data["cab location"] = value),
              ),
              _buildNumberField(
                label: 'Количество грузовых тележек, шт',
                value: widget.data["identical hoists volume"],
                onChanged:
                    (value) => setState(
                      () => widget.data["identical hoists volume"] = value,
                    ),
                isInteger: true,
              ),
              _buildNumberField(
                label: 'Максимальная масса крана, т',
                value: widget.data["max crane mass"],
                onChanged:
                    (value) =>
                        setState(() => widget.data["max crane mass"] = value),
              ),
              _buildNumberField(
                label: 'Допускаемое давление колеса, кН',
                value: widget.data["max wheel load"],
                onChanged:
                    (value) =>
                        setState(() => widget.data["max wheel load"] = value),
              ),
              const SizedBox(height: 24),
              const Text(
                'Габаритные размеры крана',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildNumberField(
                label: 'Пролёт крана, м',
                value: widget.data["span"],
                onChanged:
                    (value) => setState(() => widget.data["span"] = value),
              ),
              _buildNumberField(
                label: 'Приближение к левому краю (l1), м',
                value: widget.data["left edge approach lifting device"],
                onChanged:
                    (value) => setState(
                      () =>
                          widget.data["left edge approach lifting device"] =
                              value,
                    ),
              ),
              _buildNumberField(
                label: 'Приближение к правому краю (l2), м',
                value: widget.data["right edge approach lifting device"],
                onChanged:
                    (value) => setState(
                      () =>
                          widget.data["right edge approach lifting device"] =
                              value,
                    ),
              ),
              _buildNumberField(
                label: 'Вертикальное расстояние до грузозахватного органа, м',
                value:
                    widget
                        .data["vertical distance from crane rail to lifting device"],
                onChanged:
                    (value) => setState(
                      () =>
                          widget.data["vertical distance from crane rail to lifting device"] =
                              value,
                    ),
              ),
              _buildNumberField(
                label: 'Макс. расстояние до верхней точки крана, м',
                value:
                    widget
                        .data["maximum vertical distance from the crane rail to the top of the crane"],
                onChanged:
                    (value) => setState(
                      () =>
                          widget.data["maximum vertical distance from the crane rail to the top of the crane"] =
                              value,
                    ),
              ),
              _buildNumberField(
                label: 'Максимальная база крана, м',
                value: widget.data["max crane base"],
                onChanged:
                    (value) =>
                        setState(() => widget.data["max crane base"] = value),
              ),
              _buildNumberField(
                label: 'Максимальная ширина крана, м',
                value: widget.data["max width crane"],
                onChanged:
                    (value) =>
                        setState(() => widget.data["max width crane"] = value),
              ),
            ],
          ),
        ),
      ),
    );
  }
  ///
  /// widget for number form filed
  Widget _buildNumberField({
    required String label,
    required dynamic value,
    required void Function(dynamic) onChanged,
    bool isInteger = false,
  }) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.3,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: TextFormField(
          initialValue: value?.toString(),
          decoration: InputDecoration(
            labelText: label,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.numberWithOptions(
            decimal: !isInteger, 
            signed: true, 
          ),
          onChanged: (value) {
            if (isInteger) {
              final num = int.tryParse(value);
              if (num != null) onChanged(num);
            } else {
              final num = double.tryParse(value);
              if (num != null) onChanged(num);
            }
            _validateForm();
          },
          validator: _validateNotEmpty,
        ),
      ),
    );
  }
  ///
  /// widget for text form field
  Widget _buildTextField({
    required String label,
    required String value,
    required void Function(String) onChanged,
  }) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.3,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: TextFormField(
          initialValue: value,
          decoration: InputDecoration(
            labelText: label,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(),
          ),
          onChanged: (value) {
            onChanged;
            _validateForm();
          },
          validator: _validateNotEmpty,
        ),
      ),
    );
  }
  ///
  /// widget for drop down menu form field
  Widget _buildDropdownField<T>({
    required String label,
    required T? value,
    required List<T> items,
    required void Function(T?) onChanged,
    T? dropdownValue,
  }) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.3,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: DropdownButtonFormField<T>(
          value: items.contains(value) ? value : null,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
          ),
          items: [
            DropdownMenuItem<T>(value: null, child: Text('-')),
            ...items.map(
              (T item) => DropdownMenuItem<T>(
                value: item,
                child: Text(item.toString()),
              ),
            ),
          ],
          onChanged: (T? value) {
            onChanged(value);
            _validateForm();
          },
          validator: _validateNotEmpty,
        ),
      ),
    );
  }
  ///
  /// Check if field is empty
  String? _validateNotEmpty(value) {
    if (value == null || value.isEmpty) {
      return 'This field is necessarily required';
    }
    return null;
  }
  ///
  /// Check if all fields in form are not empty
  /// and notificate [PagesSwitch].
  void _validateForm() {
    final isValid = validate();
    widget.onValidationChanged?.call(isValid);
  }
  ///
  /// Check if all fields in form are not empty
  bool validate() {
    return _formKey.currentState?.validate() ?? false;
  }
}
// ElevatedButton(
              //   onPressed: _validateForm,
              //   child: const Text('Сохранить'),
              // ),
              // SizedBox(
              //   width: MediaQuery.sizeOf(context).width * 0.25,
              //   child: InputDecorator(
              //     decoration: InputDecoration(
              //       enabledBorder: OutlineInputBorder(),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           'Name of the field',
              //           style: Theme.of(context).textTheme.bodyLarge,
              //         ),
              //         Checkbox(
              //           value: _checkboxValue,
              //           onChanged: (value) {
              //             setState(() {
              //               _checkboxValue = value ?? false;
              //             });
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // ),