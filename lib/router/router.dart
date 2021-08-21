import 'package:fluro/fluro.dart';
import 'package:landing_page_flutter/router/route_handlers.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  //Routes
  static void configureRoutes() {
    //Home
    router.define('/:page', handler: homeHandler);

    //404
    router.notFoundHandler = homeHandler;
  }
}
