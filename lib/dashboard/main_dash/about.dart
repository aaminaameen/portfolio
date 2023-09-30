import 'package:flutter/material.dart';

import '../../models/responsive.dart';
import '../main/resp_about/about_desk.dart';
import '../main/resp_about/about_mob.dart';
import '../main/resp_about/about_tab.dart';


class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: AboutMobile(),
      tablet: AboutTablet(),
      desktop: AboutDesktop(),
    );
  }
}
