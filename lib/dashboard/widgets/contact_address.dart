import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';

class ContactAddress extends StatelessWidget {
  final String title;
  final String contact;
  final IconData icon;

  const ContactAddress({
    super.key,
    required this.title,
    required this.contact,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: kWhiteColor.withOpacity(.8),
              ),
              kWidth5,
              Text(
                title,
                style: GoogleFonts.nunito(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: kWhiteColor,
                ),
              )
            ],
          ),
          Text(
            contact,
            style: GoogleFonts.nunito(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              color: kBlackColor.withOpacity(.3),
            ),
          )
        ],
      ),
    );
  }
}
