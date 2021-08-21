import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {
  const CustomMenuItem({
    Key? key,
    required this.text,
    required this.onTap,
    this.delay = 0,
  }) : super(key: key);

  final String text;
  final GestureTapCallback onTap;
  final int delay;

  @override
  _CustomMenuItemState createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: Duration(milliseconds: 2000),
      delay: Duration(milliseconds: widget.delay),
      child: MouseRegion(
        onEnter: (context) => setState(() => isHover = true),
        onExit: (context) => setState(() => isHover = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            width: 150,
            height: 50,
            color: isHover ? Colors.pinkAccent : Colors.black,
            child: Center(
              child: Text(
                widget.text,
                style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
