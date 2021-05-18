import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/theme/color_theme.dart';

class TextThemes {
  static var statusTextSttleRed = TextStyle(
      height: 1.6,
      letterSpacing: 1.5,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: ColorPalette.red);

  static var statusTextSttleGreen = TextStyle(
      height: 1.6,
      letterSpacing: 1.5,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: ColorPalette.greenColor);

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
}
