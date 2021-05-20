import 'package:flutter/material.dart';
import 'package:rick_and_morty/recources/icons.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/screen.dart';
import 'package:rick_and_morty/theme/color_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TapBarScreen extends StatefulWidget {
  @override
  _TapBarScreenState createState() => _TapBarScreenState();
}

class _TapBarScreenState extends State<TapBarScreen> {
  int screenIdex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.darkBlue,
      body: IndexedStack(
        children: [
          HomeScreen(),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Text("Второй"),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Text("Трейтий"),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Text("Трейтий"),
            ),
          )
        ],
        index: screenIdex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: ColorPalette.greenColor),
        unselectedIconTheme: IconThemeData(color: ColorPalette.greyColor_1),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: ColorPalette.greyColor_1,
        selectedFontSize: 12,
        selectedItemColor: ColorPalette.greenColor,
        backgroundColor: ColorPalette.secondPrimary,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              MainIcons.persons,
              color: ColorPalette.greyColor_1,
            ),
            label: "Персонажи",
            activeIcon: SvgPicture.asset(MainIcons.persons,
                color: ColorPalette.greenColor),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              MainIcons.location,
            ),
            label: "Локации",
            activeIcon: SvgPicture.asset(
              MainIcons.location,
              color: ColorPalette.greenColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              MainIcons.episode,
            ),
            label: "Эпизоды",
            activeIcon: SvgPicture.asset(MainIcons.episode,
                color: ColorPalette.greenColor),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              MainIcons.settings,
            ),
            label: "Настройки",
            activeIcon: SvgPicture.asset(MainIcons.settings,
                color: ColorPalette.greenColor),
          ),
        ],
        currentIndex: screenIdex,
        onTap: (int i) {
          setState(() {
            screenIdex = i;
          });
        },
      ),
    );
  }
}
