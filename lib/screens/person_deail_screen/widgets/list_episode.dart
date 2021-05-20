import 'package:flutter/material.dart';
import 'package:rick_and_morty/recources/variables.dart';
import 'package:rick_and_morty/theme/color_theme.dart';

Widget listEpisod(int i) {
  return InkWell(
    onTap: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
                child: Image.asset("assets/images/episod${i + 1}.png"),
                width: 74,
                height: 74,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10))),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("CЕРИЯ ${i + 1}",
                    style: TextStyle(
                        color: ColorPalette.blue.withOpacity(0.87),
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        height: 1.6,
                        letterSpacing: 1.5)),
                Text(variables.titles[i],
                    style: TextStyle(
                        color: ColorPalette.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 1.5,
                        letterSpacing: 0.5)),
                Text(variables.titles[i],
                    style: TextStyle(
                        color: ColorPalette.greyColor_1,
                        fontSize: 14,
                        height: 1.4,
                        letterSpacing: 0.25))
              ],
            )
          ],
        ),
        Icon(Icons.arrow_forward_ios, color: ColorPalette.white, size: 16)
      ],
    ),
  );
}
