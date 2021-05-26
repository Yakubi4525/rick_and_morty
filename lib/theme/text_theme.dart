import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/theme/color_theme.dart';

class TextThemes {
  static var tittlTextStyle = TextStyle(
    color: ColorPalette.white,
    fontSize: 34,
    height: 40 / 34,
  );

  static var statusTextSttleRed = TextStyle(
      height: 1.6,
      letterSpacing: 1.5,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: ColorPalette.red);

  static var simpleTextStyle = TextStyle(
    color: ColorPalette.white,
    fontSize: 13,
    height: 1.5,
    letterSpacing: 0.5,
  );
  static var namePersonTextStyle = TextStyle(
      height: 1.8,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: ColorPalette.white);

  static var genderPersonTextStyle = TextStyle(
      height: 1.6,
      letterSpacing: 0.5,
      fontSize: 12,
      color: ColorPalette.greyColor_1);

  static var h3textStyle = TextStyle(
    color: ColorPalette.white,
    height: 1.4,
    letterSpacing: 0.25,
    fontSize: 14
  );

  static var h1textStyle = TextStyle(
      color: ColorPalette.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
      height: 1.4);
  static var h2textStyle = TextStyle(
      color: ColorPalette.greyColor_1,
      fontSize: 12,
      height: 1.3,
      letterSpacing: 0.5);
}
