import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/social_media_list.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../widgets/contact_address.dart';
import '../widgets/social_media.dart';

class Contact extends StatefulWidget {
  final Key? key;

  Contact({this.key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final socialMedia = socialMediaList;
  var socialIndex;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        kHeight100,
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Contact Me\n',
                style: GoogleFonts.nunito(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                  color: kPrimaryColor,
                ),
              ),
              TextSpan(
                text:
                    'If you have any questions please feel free to contact me',
                style: GoogleFonts.quicksand(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: kBlackColor.withOpacity(0.9)),
              )
            ],
          ),
        ),
        kHeight25,
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            //  height: height * .3,
            //  width: width * .7,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [kPrimaryColor, kPrimaryColor.withOpacity(.3)]),
                border: Border.all(
                  width: 2,
                  color: Colors.white30,
                ),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Wrap(
                  spacing: 40.0,
                  runSpacing: 30.0,
                  children: [
                    ContactAddress(
                      contact: 'Trivandrum,Kerala',
                      icon: Icons.home,
                      title: 'Location',
                    ),
                    ContactAddress(
                      contact: '+91- 8893917626',
                      icon: Icons.phone,
                      title: 'Phone Number',
                    ),
                    ContactAddress(
                      contact: 'mail2aamizallu@gmail.com',
                      icon: Icons.email,
                      title: 'Email Address',
                    ),
                  ],
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
                            final Uri url =
                                Uri.parse(socialMedia[index].socialMediaLink);
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
              ],
            ),
          ),
        ),
        kHeight100,
        Container(
          height: 50,
          width: double.infinity,
          color: kPrimaryColor,
        ),
      ],
    );
  }
}
