import 'package:flutter/material.dart';
import 'package:rick_and_morty/recources/variables.dart';
import 'package:rick_and_morty/theme/color_theme.dart';
import 'package:rick_and_morty/theme/text_theme.dart';

class ListEpisode extends StatelessWidget {
  final int id;

  const ListEpisode({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  child: Image.asset("assets/images/episod${id + 1}.png"),
                  width: 74,
                  height: 74,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10))),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CЕРИЯ ${id + 1}",
                      style: TextThemes.statusTextSttleRed.copyWith(
                        color: ColorPalette.blue.withOpacity(0.87),
                      )),
                  Text(
                    variables.titles[id],
                    style: TextThemes.simpleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    variables.titles[id],
                    style: TextThemes.h3textStyle.copyWith(
                      color: ColorPalette.greyColor_1,
                    ),
                  )
                ],
              )
            ],
          ),
          Icon(Icons.arrow_forward_ios, color: ColorPalette.white, size: 16)
        ],
      ),
    );
  }
}
