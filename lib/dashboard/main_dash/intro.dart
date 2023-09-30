import 'package:flutter/material.dart';

import '../../models/responsive.dart';
import '../main/resp_intro/intro_desk.dart';
import '../main/resp_intro/intro_mobile.dart';
import '../main/resp_intro/intro_tab.dart';


class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: IntroductionMobile(),
      tablet: IntroductionTablet(),
      desktop: IntroductionDesktop(),
    );
  }
}
