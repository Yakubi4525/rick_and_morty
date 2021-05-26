import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/screens/person_deail_screen/bloc/person_screen_bloc.dart';
import 'package:rick_and_morty/screens/person_deail_screen/screen.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/home_models/person.dart';
import 'package:rick_and_morty/theme/color_theme.dart';
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
              Navigator.of(context).push(
                _createRoute(model: model),
              );
            },
            child: Row(
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 37,
                    backgroundImage: NetworkImage(model.image),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.status == "Alive" ? "ЖИВОЙ" : "МЕРТВЫЙ",
                        style: model.status == "Alive"
                            ? TextThemes.statusTextSttleRed
                                .copyWith(color: ColorPalette.greenColor)
                            : TextThemes.statusTextSttleRed),
                    Text('${model.name}',
                        overflow: TextOverflow.ellipsis,
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
///Function for animation of transition from vertical to horizontal.e 
Route _createRoute({PersonModel model}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
      create: (context) => PersonScreenBloc()
        ..add(
          PersonScreenEvent.initalEvent(),
        ),
      child: PersonScreen(
        model: model,
      ),
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
