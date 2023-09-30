
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class SocialMediaIcon extends StatefulWidget {
  final String iconImage;
  final int index;
  final bool isHoverd;

  const SocialMediaIcon({
    required this.iconImage,
    required this.index,
    required this.isHoverd,
  });

  @override
  _SocialMediaIconState createState() => _SocialMediaIconState();
}

class _SocialMediaIconState extends State<SocialMediaIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isHovered
            ? kPrimaryColor.withOpacity(0.5)
            : kGlowingColor2.withOpacity(.3),
        border: Border.all(
          color: isHovered ? kPrimaryColor : kWhiteColor,
          width: 2.0,
        ),
      ),
      child: FadeInUp(
        duration: const Duration(milliseconds: 1000),
        delay: const Duration(milliseconds: 600),
        child: Center(
          child: Image.asset(
            widget.iconImage,
            width: 30.0,
            height: 30.0,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
