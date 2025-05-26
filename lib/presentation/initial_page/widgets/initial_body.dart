import 'package:flutter/material.dart';
import 'package:hmi_networking/hmi_networking.dart';
import 'package:cdt_client/presentation/core/widgets/pages_switch/form_page.dart';
///
/// The body widget of the [InitialPage].
/// Builds the body on the base of form of the 
/// current page,content of all pages to access 
/// necessary data and current user to display 
/// the content that he needs.
class InitialBody extends StatelessWidget {
  //final Pages form;
  //final Map<Pages, Map> pageData;
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
