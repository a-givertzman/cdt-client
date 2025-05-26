import 'package:flutter/material.dart';
import 'package:hmi_networking/hmi_networking.dart';
///
/// [InitialPage] body widget.
/// The form provides view / edit of [initial data](https://github.com/a-givertzman/cdt-math/blob/master/design/docs/algorithm_single_ginger_overhead_crane/part01_initialization/chapter01_initialData/chapter01_initialData.md).
/// Access to edit may be restricted depends on user priveleges.
class InitialBody extends StatelessWidget {
  // final Pages form;
  // final Map<Pages, Map> pageData;
  final AppUserStacked users;
  /// 
  /// The body of the [InitialPage] widget.
  /// 
  /// [form] - current form
  /// [pageData] - content of all forms
  /// [users] - all stored users
  const InitialBody({
    super.key,
    //required this.form,
    //required this.pageData,
    required this.users,
  });
  //
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Инициализация входных данных',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          DropdownButton<String>(
            items: <String>['A', 'B', 'C', 'D'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Номинальная скорость подъема механизма*'),
            //onChanged: (value) => pageData[form]?['vhmax'] = value,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Замедленная скорость подъёма механизма*'),
            keyboardType: TextInputType.number,
            //onChanged: (value) => pageData[form]?['vhcs'] = value,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
