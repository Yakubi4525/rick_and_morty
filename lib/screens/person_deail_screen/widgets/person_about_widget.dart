import 'package:flutter/material.dart';
import 'package:rick_and_morty/recources/variables.dart';
import 'package:rick_and_morty/screens/person_deail_screen/widgets/enter.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/home_models/person.dart';
import 'package:rick_and_morty/theme/text_theme.dart';

class PersonAboutWidget extends StatelessWidget {
  final PersonModel model;

  const PersonAboutWidget({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text(Variables.personAboutText, style: TextThemes.simpleTextStyle),
            const SizedBox(height: 24),
            Row(children: [
              Expanded(
                  child: Text("Пол", style: TextThemes.genderPersonTextStyle)),
              Expanded(
                  child: Text("Расса", style: TextThemes.genderPersonTextStyle))
            ]),
            const SizedBox(height: 4),
            Row(children: [
              Expanded(
                  child: Text(model.gender == "Male" ? "Мужчина" : "Женщина",
                      style: TextThemes.namePersonTextStyle)),
              Expanded(
                  child: Text(model.species == "Human" ? "Человек" : "Животное",
                      style: TextThemes.namePersonTextStyle))
            ]),
            const SizedBox(height: 20),
            EnterWidget(keyText: "Место рождения", value: "Земля C-137"),
            const SizedBox(
              height: 16,
            ),
            EnterWidget(
                keyText: "Местоположение", value: "Земля (Измерение подменны)"),
          ],
        ));
  }
}
