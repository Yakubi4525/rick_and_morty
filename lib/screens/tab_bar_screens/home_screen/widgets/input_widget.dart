import 'package:flutter/material.dart';
import 'package:rick_and_morty/recources/icons.dart';
import 'package:rick_and_morty/theme/color_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomInputWidget extends StatelessWidget {
  final Size screenSize;
  final TextEditingController controller;

  const CustomInputWidget({Key key, this.screenSize, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        height: 48,
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
      ),
    );
  }
}
