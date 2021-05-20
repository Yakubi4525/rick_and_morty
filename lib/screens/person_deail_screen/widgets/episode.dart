import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/person_deail_screen/widgets/episode_list.dart';
import 'package:rick_and_morty/theme/color_theme.dart';

Widget episodes() {
  return Column(
      children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Эпизоды",
                      style: TextStyle(
                          color: ColorPalette.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          height: 1.4)),
                  Text("Все эпизоды",
                      style: TextStyle(
                          color: ColorPalette.greyColor_1,
                          fontSize: 12,
                          height: 1.3,
                          letterSpacing: 0.5))
                ]),
          ] +
          episodList());
}
