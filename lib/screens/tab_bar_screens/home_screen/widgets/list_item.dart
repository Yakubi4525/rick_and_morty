import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/person_deail_screen/screen.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/home_models/person.dart';
import 'package:rick_and_morty/theme/text_theme.dart';

class ListItem extends StatelessWidget {
  final PersonModel model;

  const ListItem({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                            model: model,
                          )));
            },
            child: Row(
              children: [
                Container(
                    child: CircleAvatar(
                  radius: 37,
                  backgroundImage: NetworkImage(model.image),
                )),
                SizedBox(
                  width: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.status == "Alive" ? "ЖИВОЙ" : "МЕРТВЫЙ",
                        style: model.status == "Alive"
                            ? TextThemes.statusTextSttleGreen
                            : TextThemes.statusTextSttleRed),
                    Text('${model.name}',
                        style: TextThemes.namePersonTextStyle),
                    Text(
                        '${model.species == "Human" ? "Человек" : "Животное"}, ${model.gender == "Male" ? "Мужчина" : "Женщина"}',
                        style: TextThemes.genderPersonTextStyle),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
