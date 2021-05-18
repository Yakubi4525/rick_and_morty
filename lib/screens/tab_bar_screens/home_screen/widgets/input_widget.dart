import 'package:flutter/material.dart';
import 'package:rick_and_morty/recources/icons.dart';
import 'package:rick_and_morty/theme/color_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildInputWidget({@required Size screenSize, @required TextEditingController controller}) {
  return Container(
    height: 48,
    margin: EdgeInsets.only(top: 54, bottom: 24),
    padding: EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
        color: ColorPalette.secondPrimary,
        borderRadius: BorderRadius.circular(100)),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Icon(
            Icons.search,
            color: ColorPalette.greyColor_1,
          ),
        ),
        Container(
            width: screenSize.width - 141,
            height: 48,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 12),
                  border: InputBorder.none,
                  hintText: "Найти персонажа",
                  hintStyle: TextStyle(color: ColorPalette.greyColor_1)),
              controller: controller,
            )),
        Container(
            color: ColorPalette.white.withOpacity(0.1),
            width: 1,
            margin: EdgeInsets.only(right: 14)),
        SvgPicture.asset(MainIcons.filter)
      ],
    ),
  );
}
