import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/home_models/person.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/widgets/grid_item.dart';
import 'package:rick_and_morty/theme/color_theme.dart';

class BuildGridWidget extends StatelessWidget {
  final List<PersonModel> persons;
  const BuildGridWidget({Key key, this.persons}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (persons.length == 0) {
      return Container(
        color: ColorPalette.darkBlue,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: size.width,
        child: Center(
          child: Text(
            "No more persons",
            style: TextStyle(color: Colors.black45),
          ),
        ),
      );
    } else {
      return Container(
        width: size.width,
        color: ColorPalette.darkBlue,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          itemCount: persons.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              crossAxisCount: 2,
              childAspectRatio: 0.8),
          itemBuilder: (context, index) {
            return GridItem(
              model: persons[index],
            );
          },
        ),
      );
    }
  }
}
