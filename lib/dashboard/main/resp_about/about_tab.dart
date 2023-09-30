import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/contents.dart';
import '../../../utils/colors.dart';

class AboutTablet extends StatelessWidget {
  final Key? key;

  AboutTablet({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 650.0,
        width: double.infinity,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [kPrimaryColor, Colors.white30]),
            border: Border.all(
              width: 2,
              color: Colors.white30,
            ),
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'About',
                    style: GoogleFonts.nunito(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                      color: kWhiteColor,
                    ),
                  ),
                  TextSpan(
                    text: ' Me\n',
                    style: GoogleFonts.nunito(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor,
                    ),
                  ),
                  TextSpan(
                    text: "The story behind me :)\n\n",
                    style: GoogleFonts.quicksand(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: kBlackColor.withOpacity(0.9)),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/portrait.png',
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: MyContents.knowMe,
                      style: GoogleFonts.quicksand(
                          color: kPrimaryColor, fontSize: 20),
                      children: [
                        TextSpan(
                          text: MyContents.aboutDescription,
                          style: GoogleFonts.quicksand(
                              color: kPrimaryColor, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
