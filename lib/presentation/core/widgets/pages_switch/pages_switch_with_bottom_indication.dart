import 'package:cdt_client/presentation/initial_page/initial_page.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/core/widgets/pages_switch/form_page.dart';
import 'package:hmi_networking/hmi_networking.dart';
import 'package:cdt_client/infrostructure/bc/sgoc_init.dart';
///
/// Widget that implements switching between 
/// pages with bottom indication. Switching 
/// is using enum with indexes of pages to switch.
/// Bottom indication is circle buttons, their number
/// is equel to the number of pages.
class PagesSwitch extends StatefulWidget {
  final AppUserStacked _users;
  //final AppThemeSwitch _themeSwitch;
  ///
  /// Widget that implements switching between pages.
  ///
  /// [users] - list of all stored useres
  const PagesSwitch({
    super.key,
    required AppUserStacked users,
    //required AppThemeSwitch themeSwitch,
  }):
  _users = users;
  //
  @override
  State<PagesSwitch> createState() => _PagesSwitchState();
}
//
class _PagesSwitchState extends State<PagesSwitch> {
  static const _slideDuration = Duration(milliseconds: 300);
  static const List<Pages> _pages = [Pages.initialPage, Pages.advnSettPageFirst, Pages.advnSettPageSecond];
  late final PageController _pageController;
  Pages _currentPage = Pages.initialPage;
  final Map<Pages, Map> _pageData = { for (var k in _pages) k : {} }; 
  bool _isCurrentFormValid = false;
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
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentPage = Pages.values[index]),
        children: _pages.map(_createFormByIndex).toList(),
      ),
      bottomNavigationBar: _buildBottomControls(),
    );
  }
  ///
  /// Creating all forms on the base of their index
  Widget _createFormByIndex(Pages form) {
    switch(form) {
      case Pages.initialPage:
        return InitialPage(
          form: form,
          users: widget._users,
          data: Data.data,
          //pageData: _pageData,
          onValidationChanged: (isValid) => _updateFormValidity(form, isValid),
        );
      case Pages.advnSettPageFirst:
        return InitialPage(
          form: form,
          users: widget._users,
          data: Data.data,
          //pageData: _pageData,
          onValidationChanged: (isValid) => _updateFormValidity(form, isValid),
        );
      case Pages.advnSettPageSecond:
        return InitialPage(
          form: form,
          users: widget._users,
          data: Data.data,
          //pageData: _pageData,
          onValidationChanged: (isValid) => _updateFormValidity(form, isValid),
        );
    }
  }
  ///
  /// Implementation of bottom indication
  Widget _buildBottomControls() {
    final iconSize = Theme.of(context).iconTheme.size ?? 24.0;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // cheak if the page is first for back button placement
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
                onPressed: () =>_isCurrentFormValid ? _slideToPage(page.index) : null,
                icon: const Icon(Icons.circle),
                color: _currentPage == page
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
                iconSize: _currentPage == page
                  ? iconSize * 1.3
                  : null,
              )
            ).toList(),
          ),
          // cheak if the page is last for next or submit button placement
          if (_currentPage != _pages.last)
            ElevatedButton(
              onPressed: () {
                if (_isCurrentFormValid) {
                  _slideFwd();
                }
              }, 
              child: const Text('Далее'),
            )
          else
            ElevatedButton(
              onPressed: () {
                if (_isCurrentFormValid) {
                _submitAllForms();
                }
              },
              child: const Text('Готово'),
            ),
        ],
      ),
    );
  }
  ///
  /// Just sliding forward
  void _slideFwd() {
    _currentPage = _currentPage.add();
    _slideToPage(_currentPage.index);
  }
  ///
  /// Just sliding backward
  void _slideBak() {
    _currentPage = _currentPage.sub();
    _slideToPage(_currentPage.index);
  }
  ///
  /// Slide to page with animation 
  void _slideToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: _slideDuration,
      curve: Curves.easeInOut,
    );
  }
  ///
  /// Submition of all forms 
  void _submitAllForms() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
  ///
  /// Form validity update
  void _updateFormValidity(Pages form, bool isValid) {
    if (form == _currentPage) {
      setState(() {
        _isCurrentFormValid = isValid;
      });
    }
  }
}
