import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landing_page_flutter/providers/page_provider.dart';
import 'package:landing_page_flutter/ui/share/custom_menu_item.dart';
import 'package:provider/provider.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  _CustomAppMenuState createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  //late means that is null but we will have later value
  late AnimationController controller;

  @override
  void initState() {
    //here we give value to the controller
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PageProvider pageProvider =
        Provider.of<PageProvider>(context, listen: false);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            controller.reverse();
          } else {
            controller.forward();
          }
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),
              if (isOpen) ...[
                CustomMenuItem(
                  text: 'Home',
                  delay: 100,
                  onTap: () {
                    pageProvider.goTo(0);
                  },
                ),
                CustomMenuItem(
                  text: 'About',
                  delay: 200,
                  onTap: () => pageProvider.goTo(1),
                ),
                CustomMenuItem(
                  text: 'Pricing',
                  delay: 300,
                  onTap: () => pageProvider.goTo(2),
                ),
                CustomMenuItem(
                  text: 'Contact',
                  delay: 400,
                  onTap: () => pageProvider.goTo(3),
                ),
                CustomMenuItem(
                  text: 'Location',
                  delay: 500,
                  onTap: () => pageProvider.goTo(4),
                ),
                SizedBox(
                  height: 8.0,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            width: isOpen ? 40.0 : 0,
          ),
          Text(
            'Menu',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
