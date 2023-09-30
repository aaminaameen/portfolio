import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import '../../models/contents.dart';
import '../widgets/portfolio_card.dart';

class Portfolio extends StatefulWidget {
  final Key? key;

  Portfolio({this.key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'My Assets\n',
            style: GoogleFonts.quicksand(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
            children: [
              TextSpan(
                text: "Let's Journey Through My Flutter World  :)\n\n",
                style: GoogleFonts.quicksand(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: kBlackColor.withOpacity(0.9)),
              )
            ],
          ),
        ),
        const Wrap(
          spacing: 40.0,
          runSpacing: 30.0,
          children: [
            PortfolioCard(
              title: 'NIC\n',
              description: MyContents.nic,
              imagePath: 'assets/images/nic.png',
              imageBack: 'assets/images/project_nic.jpg',
            ),
            PortfolioCard(
              title: 'Pattarya Samajam\n',
              description: MyContents.patt,
              imagePath: 'assets/images/patt.png',
              imageBack: 'assets/images/god.png',
            ),
            PortfolioCard(
              title: 'Sri Sai College\n',
              description: MyContents.sri,
              imagePath: 'assets/images/sri.png',
              imageBack: 'assets/images/sri_logo.png',
            ),
          ],
        ),
      ],
    );
  }
}
