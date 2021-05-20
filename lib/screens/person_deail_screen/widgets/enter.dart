import 'package:flutter/material.dart';
import 'package:rick_and_morty/theme/color_theme.dart';

Widget enterWidget(String key, String value){
  return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(key,
                  style: TextStyle(
                      color: ColorPalette.greyColor_1, height: 1.6, letterSpacing: 0.5)),
              Text(value,
                  style: TextStyle(
                      color: ColorPalette.white, height: 1.4, letterSpacing: 0.25))
            ],
          ),
          Icon(Icons.arrow_forward_ios, color: ColorPalette.white, size: 16)
        ],
      ),
    );
}