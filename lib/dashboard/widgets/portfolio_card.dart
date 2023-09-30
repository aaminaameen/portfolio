import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import 'flip_card.dart';

class PortfolioCard extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;
  final String imageBack;

  const PortfolioCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.imageBack,
  }) : super(key: key);

  @override
  _PortfolioCardState createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        cardKey.currentState!.toggleCard();
      },
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: FlipCard(
        key: cardKey,
        back: FlipCardBack(
          isHover: isHover,
          imageBack: widget.imageBack,
          title: widget.title,
          description: widget.description,
        ),
        front: FlipCardFront(
          isHover: isHover,
          imagePath: widget.imagePath,
        ),
      ),
    );
  }
}

class FlipCardFront extends StatelessWidget {
  const FlipCardFront({
    super.key,
    required this.isHover,
    required this.imagePath,
  });

  final bool isHover;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: 400,
        height: 400,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Colors.white30, kPrimaryColor.withOpacity(.3)]),
          border: Border.all(
            width: 3,
            color: Colors.white30,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: isHover
              ? [
                  BoxShadow(
                    color: kWhiteColor.withOpacity(.3),
                    blurRadius: 12.0,
                    offset: const Offset(0.0, 0.0),
                  )
                ]
              : [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(.3),
                    blurRadius: 12.0,
                    offset: const Offset(0.0, 0.0),
                  )
                ],
        ),
        child: Stack(
          children: [
            SizedBox(
              height: 340,
              width: double.infinity,
              child: Image.asset(
                imagePath,
                fit: BoxFit.fill,
              ),
            ),
            const Positioned(
              bottom: 20,
              right: 10,
              child: CircleAvatar(
                backgroundColor: kPrimaryColor,
                radius: 30,
                child: Icon(
                  Icons.arrow_forward,
                  color: kBlackColor,
                  size: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FlipCardBack extends StatelessWidget {
  const FlipCardBack({
    super.key,
    required this.isHover,
    required this.imageBack,
    required this.title,
    required this.description,
  });

  final bool isHover;
  final String imageBack;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 300,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Colors.white30, kPrimaryColor.withOpacity(.3)]),
          border: Border.all(
            width: 3,
            color: Colors.white30,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: isHover
              ? [
                  BoxShadow(
                    color: kPrimaryColor.withAlpha(100),
                    blurRadius: 12.0,
                    offset: const Offset(0.0, 0.0),
                  )
                ]
              : [
                  BoxShadow(
                    color: kWhiteColor.withOpacity(.3),
                    blurRadius: 12.0,
                    offset: const Offset(0.0, 0.0),
                  )
                ],
        ),
        child: Column(
          children: [
            Image.asset(
              imageBack,
              height: 30,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: title,
                style: GoogleFonts.quicksand(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
                children: [
                  TextSpan(
                    text: description,
                    style: GoogleFonts.quicksand(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: kBlackColor.withOpacity(0.9)),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
