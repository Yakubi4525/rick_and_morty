import 'package:flutter/material.dart';
import 'package:rick_and_morty/recources/variables.dart';
import 'package:rick_and_morty/screens/person_deail_screen/widgets/enter.dart';
import 'package:rick_and_morty/screens/person_deail_screen/widgets/episode.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/home_models/person.dart';
import 'package:rick_and_morty/theme/color_theme.dart';
import 'package:rick_and_morty/theme/text_theme.dart';

class DetailScreen extends StatefulWidget {
  final PersonModel model;
  const DetailScreen({this.model});
  @override
  _DetailScreenState createState() => _DetailScreenState(model: model);
}

class _DetailScreenState extends State<DetailScreen> {
  final PersonModel model;

  _DetailScreenState({this.model});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: ListView(padding: EdgeInsets.zero, children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 218,
                    width: size.width,
                    child: FittedBox(
                      child: Image.network(model.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: size.width,
                    color: ColorPalette.darkBlue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 90),
                        Text(model.name, style: TextThemes.tittlTextStyle),
                        SizedBox(height: 4),
                        Text(model.status == "Alive" ? "ЖИВОЙ" : "МЕРТВЫЙ",
                            style: model.status == "Alive"
                                ? TextThemes.statusTextSttleGreen
                                : TextThemes.statusTextSttleRed),
                        SizedBox(height: 36),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                Text(Variables.personAboutText,
                                    style: TextThemes.simpleTextStyle),
                                SizedBox(height: 24),
                                Row(children: [
                                  Expanded(
                                      child: Text("Пол",
                                          style: TextThemes
                                              .genderPersonTextStyle)),
                                  Expanded(
                                      child: Text("Расса",
                                          style:
                                              TextThemes.genderPersonTextStyle))
                                ]),
                                SizedBox(height: 4),
                                Row(children: [
                                  Expanded(
                                      child: Text(
                                          model.gender == "Male"
                                              ? "Мужчина"
                                              : "Женщина",
                                          style:
                                              TextThemes.namePersonTextStyle)),
                                  Expanded(
                                      child: Text(
                                          model.species == "Human"
                                              ? "Человек"
                                              : "Животное",
                                          style:
                                              TextThemes.namePersonTextStyle))
                                ]),
                                SizedBox(height: 20),
                                enterWidget("Место рождения", "Земля C-137"),
                                SizedBox(
                                  height: 16,
                                ),
                                enterWidget("Местоположение",
                                    "Земля (Измерение подменны)"),
                              ],
                            )),
                        Container(
                          height: 1,
                          margin: EdgeInsets.only(top: 36, bottom: 45),
                          color: ColorPalette.greyColor_1,
                        ),
                        Container(
                          child: episodes(),
                          padding: EdgeInsets.symmetric(horizontal: 16)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: size.width,
                height: 218,
                color: ColorPalette.greyColor_1.withOpacity(0.65),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 54),
                    child: Container(
                        decoration: BoxDecoration(
                          //color: ColorPalette.secondPrimary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 48,
                        width: 48,
                        child: FloatingActionButton(
                          backgroundColor: ColorPalette.secondPrimary,
                          child: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                  ),
                  SizedBox(height: 36),
                  Center(
                    child: Container(
                        width: 146,
                        height: 146,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                width: 8, color: ColorPalette.darkBlue)),
                        child: FittedBox(
                            child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(model.image),
                        ))),
                  )
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
