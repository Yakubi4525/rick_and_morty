import 'package:flutter/material.dart';
import 'package:rick_and_morty/theme/color_theme.dart';

class LineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: EdgeInsets.only(top: 36, bottom: 45),
      color: ColorPalette.greyColor_1,
    );
  }
}
