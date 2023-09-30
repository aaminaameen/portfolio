import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CardWidget extends StatefulWidget {
  final String title;
  final String content;
  final String imagePath;

  const CardWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.imagePath,
  }) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        height: 420.0,
        width: 320.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                kPrimaryColor.withOpacity(.5),
                kGlowingColor1.withOpacity(.5)
              ]),
          border: Border.all(
            width: 10,
            color: Colors.white30,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned(
              top: 250.0,
              left: 20,
              right: 20,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontSize: 70.0,
                  color: kBlackColor.withOpacity(.2),
                ),
                softWrap: false,
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 575),
              curve: Curves.easeOut,
              top: isHovered ? -240.0 : -80.0,
              right: isHovered ? -100.0 : -80.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 575),
                curve: Curves.easeOut,
                height: isHovered ? 450.0 : 280.0,
                width: isHovered ? 450.0 : 280.0,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(500),
                ),
              ),
            ),
            AnimatedAlign(
              duration: const Duration(milliseconds: 375),
              curve: Curves.easeOut,
              alignment: isHovered
                  ? const Alignment(0.0, -0.8)
                  : const Alignment(0.0, 0.0),
              child: SizedBox(
                height: 100,
                width: 200.0,
                child: Image.asset(
                  widget.imagePath,
                  color: kBlackColor.withOpacity(.7),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 775),
              curve: Curves.easeOut,
              bottom: isHovered ? 0.0 : -100.0,
              child: SizedBox(
                height: 250.0,
                width: 320.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: isHovered ? 1.0 : 0.0,
                      duration: isHovered
                          ? const Duration(milliseconds: 575)
                          : const Duration(milliseconds: 375),
                      curve: isHovered ? Curves.easeInOutBack : Curves.easeOut,
                      child: Text(
                        widget.content,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: kBlackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
