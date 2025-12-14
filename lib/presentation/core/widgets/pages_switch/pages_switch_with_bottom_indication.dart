import 'package:flutter/material.dart';
import 'package:cdt_client/presentation/core/widgets/pages_switch/page_config.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_core/hmi_core_translate.dart';
///
/// Widget that provides switching between pages.
class PagesSwitch extends StatefulWidget {
  final List<PageConfig> _pages;
  final bool Function() _isPageValid;
  final void Function() _formsSubmission;
  ///
  /// Widget that provides switching
  /// between pages with bottom controls.
  /// 
  /// - [pages] - content for every page.
  /// - [isPageValid] - callback for checking if page is valid.
  const PagesSwitch({
    super.key,
    required List<PageConfig> pages,
    required bool Function() isPageValid,
    required void Function() formsSubmission,
  })  : _pages = pages, 
        _isPageValid = isPageValid,
        _formsSubmission = formsSubmission;
  //
  @override
  State<PagesSwitch> createState() => _PagesSwitchState();
}
//
class _PagesSwitchState extends State<PagesSwitch> {
  final _slideDuration = Duration(milliseconds: 300);
  late final PageController _pageController;
  int _currentPageIndex = 0;
  //
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  } 
  //
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
  //
  @override
  Widget build(BuildContext context) {
    final iconSize = Theme.of(context).iconTheme.size ?? 28.0;
    final padding = const Setting('blockPadding').toDouble;
    final isCurrentFormValid = widget._isPageValid();
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentPageIndex = index),
        children: widget._pages.map((page) => page.builder(context)).toList(),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _currentPageIndex == 0
                ? const SizedBox(width: 80)
                : ElevatedButton(
                    onPressed: () => _slideBak(),
                    child: Text('Back'.loc),
                  ),
            Row(
              children: widget._pages.asMap().entries.map(
                (entry) => IconButton(
                  onPressed: () => isCurrentFormValid 
                      ? _slideToPage(entry.key) 
                      : null,
                  color: _currentPageIndex == entry.key
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  iconSize: _currentPageIndex == entry.key
                      ? iconSize
                      : null,
                  icon: const Icon(Icons.circle),
                )
              ).toList(),
            ),
            _currentPageIndex == widget._pages.length - 1
                ? ElevatedButton(
                    onPressed: () => isCurrentFormValid 
                        ? widget._formsSubmission()
                        : null,
                    child: Text('Done'.loc),
                  )
                : ElevatedButton(
                    onPressed: () => isCurrentFormValid
                        ? _slideFwd()
                        : null,
                    child: Text('Next'.loc),
                  ),
          ],
        ),
      ),
    );
  }
  //
  void _slideFwd() {
    if (_currentPageIndex < widget._pages.length - 1) {
      _slideToPage(_currentPageIndex + 1);
    }
  }
  //
  void _slideBak() {
    if (_currentPageIndex > 0) {
      _slideToPage(_currentPageIndex - 1);
    }
  }
  //
  void _slideToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: _slideDuration,
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentPageIndex = index;
    });
  }
}
