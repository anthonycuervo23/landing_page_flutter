import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';

class PageProvider extends ChangeNotifier {
  PageController scrollController = new PageController();

  List<String> _pages = ['home', 'about', 'pricing', 'contact', 'location'];

  int _currentIndex = 0;

  void createScrollController(String routeName) {
    scrollController = new PageController(initialPage: getPageIndex(routeName));

    document.title = 'Landing Page - ${_pages[getPageIndex(routeName)]}';

    scrollController.addListener(() {
      final index = (scrollController.page ?? 0).round();

      if (index != _currentIndex) {
        window.history.pushState(null, 'esto no se usa', '#/${_pages[index]}');
        _currentIndex = index;
        document.title = 'Landing Page - ${_pages[index]}';
      }
    });
  }

  int getPageIndex(String routeName) {
    return _pages.indexOf(routeName) == -1 ? 0 : _pages.indexOf(routeName);
  }

  void goTo(int index) {
    scrollController.animateToPage(
      index,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
