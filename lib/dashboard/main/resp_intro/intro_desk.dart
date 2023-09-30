import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../models/social_media_list.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../widgets/social_media.dart';


class IntroductionDesktop extends StatefulWidget {
  final Key? key;
  IntroductionDesktop({this.key}) : super(key: key);

  @override
  State<IntroductionDesktop> createState() => _IntroductionDesktopState();
}

class _IntroductionDesktopState extends State<IntroductionDesktop> {
  var glowing = true;
  var scale = 1.0;
  final socialMedia = socialMediaList;

  int? socialIndex;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(50),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: double.infinity,
          height: height * .6,
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
              borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
            child: SizedBox(
              width: width / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      const Text("Hello, I'm\n",
                          style: TextStyle(color: kBlackColor, fontSize: 18)),
                      AnimatedTextKit(animatedTexts: [
                        TyperAnimatedText(
                          "AAMINA N R",
                          speed: const Duration(milliseconds: 100),
                          textAlign: TextAlign.left,
                          textStyle: GoogleFonts.aladin(
                              color: kBlackColor, fontSize: 35),
                        ),
                      ]),
                      const Text("Flutter Developer",
                          style: TextStyle(color: kBlackColor, fontSize: 18)),
                      kHeight50,
                      GestureDetector(
                        onTapUp: (val) {
                          setState(() {
                            glowing = false;
                            scale = 1.0;
                          });
                        },
                        onTapDown: (val) {
                          setState(() {
                            glowing = true;
                            scale = 1.1;
                          });
                        },
                        child: AnimatedContainer(
                          transform: Matrix4.identity()..scale(scale),
                          duration: const Duration(milliseconds: 200),
                          height: 48,
                          width: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              gradient: const LinearGradient(
                                colors: [
                                  kPrimaryColor,
                                  kGlowingColor2,
                                ],
                              ),
                              boxShadow: glowing
                                  ? [
                                      BoxShadow(
                                        color: kGlowingColor1.withOpacity(0.6),
                                        spreadRadius: 1,
                                        blurRadius: 16,
                                        offset: const Offset(-8, 0),
                                      ),
                                      BoxShadow(
                                        color: kGlowingColor2.withOpacity(0.6),
                                        spreadRadius: 1,
                                        blurRadius: 16,
                                        offset: const Offset(8, 0),
                                      ),
                                      BoxShadow(
                                        color: kGlowingColor1.withOpacity(0.2),
                                        spreadRadius: 16,
                                        blurRadius: 32,
                                        offset: const Offset(-8, 0),
                                      ),
                                      BoxShadow(
                                        color: kGlowingColor2.withOpacity(0.2),
                                        spreadRadius: 16,
                                        blurRadius: 32,
                                        offset: const Offset(8, 0),
                                      )
                                    ]
                                  : []),
                          child: Center(
                            child: Text(
                              glowing ? "Resume" : "Resume",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      kHeight25,
                      SizedBox(
                        height: 48,
                        child: ListView.separated(
                          itemCount: socialMedia.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, child) => kWidth10,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () async {
                                  final Uri url = Uri.parse(
                                      socialMedia[index].socialMediaLink);
                                  await launchUrl(url);
                                },
                                onHover: (value) {
                                  setState(() {
                                    if (value) {
                                      socialIndex = index;
                                    } else {
                                      socialIndex = null;
                                    }
                                  });
                                },
                                borderRadius: BorderRadius.circular(550.0),
                                hoverColor: kPrimaryColor,
                                splashColor: kWhiteColor,
                                child: SocialMediaIcon(
                                  iconImage: socialMedia[index].socialMediaIcon,
                                  index: index,
                                  isHoverd: socialIndex == index ? true : false,
                                ));
                          },
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Container(
                        height: height * .4,
                        width: height * .4,
                        padding: const EdgeInsets.all(50),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: kPrimaryColor.withAlpha(100),
                                blurRadius: 12.0,
                                offset: const Offset(0.0, 0.0),
                              )
                            ],
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomCenter,
                                colors: [kPrimaryColor, Colors.white30]),
                            border: Border.all(
                              width: 15,
                              color: Colors.white30,
                            ),
                            borderRadius: BorderRadius.circular(300)),
                        child: Image.asset(
                          'assets/images/aami.png',
                          fit: BoxFit.cover,
                          height: height * .25,
                          width: height * .25,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
