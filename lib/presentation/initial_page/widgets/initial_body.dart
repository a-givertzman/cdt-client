import 'package:flutter/material.dart';
import 'package:hmi_networking/hmi_networking.dart';

///
/// The body widget of the [HomePage]
class InitialBody extends StatefulWidget {
  final AppUserStacked users;
  ///
  /// TODO...
  const InitialBody({
    super.key,
    required this.users,
  });
  //
  @override
  State<InitialBody> createState() => _InitialBodyState();
}
//
class _InitialBodyState extends State<InitialBody> {
  static const _slideDuration = Duration(milliseconds: 300);
  static const _pages = [Page.first, Page.second, Page.third];
  late final PageController _pageController;
  Page _currentPage = Page.first;
  //
  final Map<Page, Map> _pageData = { for (var k in _pages) k : {} };
  //
   @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  //
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  //
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentPage = Page.values[index]),
        children: _pages.map(_createFormByIndex).toList(),
      ),
      bottomNavigationBar: _buildBottomControls(),
    );
  }
  ///
  Widget _createFormByIndex(Page form) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Инициализация входных данных',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20,),
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
                onChanged: (value) => _pageData[form]?['vhmax'] = value,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Замедленная скорость подъёма механизма*'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => _pageData[form]?['vhcs'] = value,
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
  }
  ///
  Widget _buildBottomControls() {
    final iconSize = Theme.of(context).iconTheme.size ?? 24.0;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_currentPage != _pages.first)
            ElevatedButton(
              onPressed: () => _slideBak(),
              child: const Text('Назад'),
            )
          else
            const SizedBox(width: 100),
          Row(
            children: _pages.map(
              (page) => IconButton(
                onPressed: () {

                },
                icon: Icon(Icons.circle),
                color: _currentPage == page
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
                iconSize: _currentPage == page
                  ? iconSize * 1.3
                  : null,
              )
            ).toList(),
          ),
          if (_currentPage != _pages.last)
            ElevatedButton(
              onPressed: () => _slideFwd(),
              child: const Text('Далее'),
            )
          else
            ElevatedButton(
              onPressed: _submitAllForms,
              child: const Text('Готово'),
            ),
        ],
      ),
    );
  }
  ///
  void _slideFwd() {
    _currentPage = _currentPage.add();
    _slideToPage(_currentPage.index);
  }
  ///
  void _slideBak() {
    _currentPage = _currentPage.sub();
    _slideToPage(_currentPage.index);
  }
  ///
  void _slideToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: _slideDuration,
      curve: Curves.easeInOut,
    );
  }

  ///
  void _submitAllForms() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Данные сохранены'),
            content: Text('Получено ${_pageData.length} форм данных'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }
}

enum Page { first, second, third }

extension PageOperators on Page {
  Page add([int? val]) {
    return Page.values[ index + (val ?? 1) ];
  }
  Page sub([int? val]) {
    return Page.values[ index - (val ?? 1) ];
  }
}