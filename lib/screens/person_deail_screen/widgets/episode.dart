import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/person_deail_screen/widgets/episode_list.dart';
import 'package:rick_and_morty/theme/color_theme.dart';
import 'package:rick_and_morty/theme/text_theme.dart';

class Episodes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Эпизоды", style: TextThemes.h1textStyle),
                  Text(
                    "Все эпизоды",
                    style: TextThemes.h2textStyle,
                  )
                ],
              ),
            ] +
            EpisodList.episodList(),
      ),
    );
  }
}
