import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../bloc/navbar_cubit.dart';
import 'main_dash/about.dart';
import 'main_dash/contact.dart';
import 'main_dash/intro.dart';
import 'main_dash/portfolio.dart';
import 'main_dash/service.dart';


class HomeScreenDesktop extends StatefulWidget {
  const HomeScreenDesktop({Key? key}) : super(key: key);

  @override
  State<HomeScreenDesktop> createState() => _HomeScreenDesktopState();
}

class _HomeScreenDesktopState extends State<HomeScreenDesktop> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ScrollOffsetController _scrollOffsetController =
      ScrollOffsetController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();
  final onMenuHover = Matrix4.identity()..scale(1.0);
  Timer? _debounce;
  final menuItems = <String>[
    'Home',
    'About',
    'Services',
    'Portfolio',
    'Contact',
  ];

  int currentIndex = 0;

  List<Widget> screensList = [];

  @override
  void initState() {
    super.initState();
    screensList = <Widget>[
      Introduction(),
      About(),
      const SkillCards(),
      Portfolio(),
      Contact()
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _itemPositionsListener.itemPositions.addListener(() {
      final indx = _itemPositionsListener.itemPositions.value.first.index;
      if (indx != currentIndex) {
        context.read<MainMenuCubit>().onSelectedMenu(indx);
      }
    });
  }

  Future scrollTo({required int index}) async {
    _itemScrollController
        .scrollTo(
            index: index,
            duration: const Duration(seconds: 2),
            curve: Curves.fastLinearToSlowEaseIn)
        .whenComplete(() {
      context.read<MainMenuCubit>().onSelectedMenu(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        toolbarHeight: 90,
        titleSpacing: 40,
        elevation: 0,
        title: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 768) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset('assets/images/sign.png',
                          height: 80, color: kPrimaryColor),
                      const Spacer(),
                      PopupMenuButton(
                        icon: const Icon(
                          Icons.menu_sharp,
                          size: 32,
                          color: kBlackColor,
                        ),
                        color: kPrimaryColor,
                        position: PopupMenuPosition.under,
                        constraints:
                            BoxConstraints.tightFor(width: size.width * 0.9),
                        itemBuilder: (BuildContext context) => menuItems
                            .asMap()
                            .entries
                            .map(
                              (e) => PopupMenuItem(
                                onTap: () {
                                  scrollTo(index: e.key);
                                },
                                child: Text(e.value),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset('assets/images/sign.png',
                          height: 80, color: kPrimaryColor),
                      const Spacer(),
                      BlocBuilder<MainMenuCubit, MainMenuState>(
                        builder: (context, state) {
                          currentIndex = (state as MainMenuSelectdState).index;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                              height: 30,
                              child: ListView.separated(
                                itemCount: menuItems.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, child) =>
                                    // Constants.sizedBox(width: 8),
                                    kWidth10,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      scrollTo(index: index);
                                    },
                                    borderRadius: BorderRadius.circular(100),
                                    onHover: (value) {
                                      if (value) {
                                        if (_debounce?.isActive ?? false) {
                                          _debounce?.cancel();
                                        }
                                        context
                                            .read<MainMenuCubit>()
                                            .onHoverMenu(
                                                value: value,
                                                hoveredIndex: index);
                                      } else {
                                        _debounce = Timer(
                                            const Duration(milliseconds: 500),
                                            () {
                                          context
                                              .read<MainMenuCubit>()
                                              .onHoverMenu(
                                                  value: value,
                                                  hoveredIndex: index);
                                        });
                                      }
                                    },
                                    child: buildNavBarAnimatedContainer(index,
                                        currentIndex == index ? true : false),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: Container(
        //  height: height,
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
        ),
        child: ScrollablePositionedList.builder(
          itemCount: screensList.length,
          itemBuilder: (context, index) => screensList[index],
          itemScrollController: _itemScrollController,
          itemPositionsListener: _itemPositionsListener,
          scrollOffsetController: _scrollOffsetController,
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }

  AnimatedContainer buildNavBarAnimatedContainer(int index, bool hover) {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: 90,
      duration: const Duration(milliseconds: 200),
      transform: hover ? onMenuHover : null,
      child: Text(
        menuItems[index],
        style: GoogleFonts.quicksand(
          fontSize: 20,
          color: hover ? kPrimaryColor : kGlowingColor1,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
