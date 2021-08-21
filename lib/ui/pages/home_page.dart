import 'package:flutter/material.dart';
import 'package:landing_page_flutter/providers/page_provider.dart';
import 'package:landing_page_flutter/ui/share/custom_app_menu.dart';

//My imports
import 'package:landing_page_flutter/ui/views/about_view.dart';
import 'package:landing_page_flutter/ui/views/contact_view.dart';
import 'package:landing_page_flutter/ui/views/home_view.dart';
import 'package:landing_page_flutter/ui/views/location_view.dart';
import 'package:landing_page_flutter/ui/views/pricing_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //we can use a gradiant background
        //that way the background wont be white
        decoration: buildBoxDecoration(),
        child: Stack(
          children: [
            //PageView
            _HomeBody(),

            //Menu
            Positioned(
              right: 20,
              top: 20,
              child: CustomAppMenu(),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.amberAccent, Colors.redAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 0.5]),
      );
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageProvider pageProvider =
        Provider.of<PageProvider>(context, listen: false);
    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView(),
      ],
    );
  }
}
