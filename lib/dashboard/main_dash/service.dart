import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/contents.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../widgets/service_card.dart';

class SkillCards extends StatelessWidget {
  final Key? key;

  const SkillCards({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'What can I do?\n',
            style: GoogleFonts.quicksand(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
            children: [
              TextSpan(
                text:
                    "I may not be perfect but together we can make awesome  :)\n\n",
                style: GoogleFonts.quicksand(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: kBlackColor.withOpacity(0.9)),
              )
            ],
          ),
        ),
        kHeight25,
        Wrap(
          spacing: 40.0,
          runSpacing: 30.0,
          children: [
            CardWidget(
              title: 'Android',
              content: MyContents.android,
              imagePath: AppAssets.logoAndroid,
            ),

            CardWidget(
              title: 'iOS',
              content: MyContents.iOS,
              imagePath: AppAssets.logoiOS,
            ),

            CardWidget(
              title: 'Web',
              content: MyContents.web,
              imagePath: AppAssets.logoWeb,
            ),
            // CardWidget(
            //   title: 'UI Design',
            //   content: MyContents.uiDesign,
            //   imagePath: AppAssets.logoUI,
            // ),
          ],
        ),
        kHeight100,
      ],
    );
  }
}
