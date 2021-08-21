import 'package:fluro/fluro.dart';
import 'package:landing_page_flutter/providers/page_provider.dart';
import 'package:landing_page_flutter/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

final Handler homeHandler = Handler(handlerFunc: (context, params) {
  final page = params['page']!.first;
  if (page != '/') {
    final PageProvider pageProvider =
        Provider.of<PageProvider>(context!, listen: false);

    pageProvider.createScrollController(page);

    return HomePage();
  }
});
