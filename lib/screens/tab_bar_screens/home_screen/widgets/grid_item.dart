import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/person_deail_screen/screen.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/home_models/person.dart';
import 'package:rick_and_morty/theme/text_theme.dart';

class GridItem extends StatelessWidget {
  final PersonModel model;

  const GridItem({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      model: model,
                    )));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(model.image),
              ),
            ),
          ),
          Spacer(),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(model.status == "Alive" ? "ЖИВОЙ" : "МЕРТВЫЙ",
                    style: model.status == "Alive"
                        ? TextThemes.statusTextSttleGreen
                        : TextThemes.statusTextSttleRed),
                Text('${model.name}', style: TextThemes.namePersonTextStyle),
                Text(
                    '${model.species == "Human" ? "Человек" : "Животное"}, ${model.gender == "Male" ? "Мужчина" : "Женщина"}',
                    style: TextThemes.genderPersonTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
