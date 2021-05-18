import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/blocs/get_list_persons_blocs.dart';
import 'package:rick_and_morty/blocs/person_bloc_models.dart';
import 'package:rick_and_morty/recources/icons.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/home_models/person.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/home_models/person_response.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/widgets/error_widget.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/widgets/input_widget.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/widgets/loading_widget.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/widgets/no_internet_widget.dart';
import 'package:rick_and_morty/theme/color_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/theme/text_theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

ScrollController controller1 = ScrollController();

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              color: ColorPalette.darkBlue,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                buildInputWidget(screenSize: size, controller: controller),
                BlocBuilder<HomeScreenBloc, HomeScreenState>(
                    builder: (context, homeState) {
                  switch (homeState.runtimeType) {
                    case HomeScreenListState:
                      return buildListWidget(size: size, context: context);

                    case HomeScreenGridState:
                      return buildLGridWidget(size: size, context: context);
                  }
                  return Container();
                }),
              ]),
            )));
  }

  Widget buildListWidget({Size size, BuildContext context}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Всего персонажей: 28",
              style: TextStyle(color: ColorPalette.greyColor_1),
            ),
            FlatButton(
                child: SvgPicture.asset(MainIcons.grid),
                onPressed: () {
                  BlocProvider.of<HomeScreenBloc>(context).add(HomeGridEvent());
                })
          ],
        ),
        Container(
          height: size.height - 230,
          width: size.width,
          child: BlocBuilder<GetPersonsBloc, PersonStates>(
              builder: (context, personState) {
            if (personState is LoadingPersonState) {
              return buildLoadingWidget();
            }
            if (personState is NoInternetPersonState) {
              return buildNoInternrtWidget(personState.message);
            }
            if (personState is SuccesPersonState) {
              return _buildListOfPersons(personState.personResponse);
            }
            if (personState is FailedPersonState) {
              return buildErrorWidget(personState.error);
            }
          }),
        ),
      ],
    );
    //  return Container();
  }

  Widget buildLGridWidget({Size size, BuildContext context}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Всего персонажей: 28",
              style: TextStyle(color: ColorPalette.greyColor_1),
            ),
            FlatButton(
                child: SvgPicture.asset(MainIcons.list),
                onPressed: () {
                  BlocProvider.of<HomeScreenBloc>(context).add(HomeListEvent());
                })
          ],
        ),
        Container(
          height: size.height - 230,
          width: size.width,
          child: BlocBuilder<GetPersonsBloc, PersonStates>(
              builder: (context, personState) {
            if (personState is LoadingPersonState) {
              return buildLoadingWidget();
            }
            if (personState is NoInternetPersonState) {
              return buildNoInternrtWidget(personState.message);
            }
            if (personState is SuccesPersonState) {
              return _buildGridOfPersons(personState.personResponse);
            }
            if (personState is FailedPersonState) {
              return buildErrorWidget(personState.error);
            }
          }),
        ),
      ],
    );
  }

  Widget _buildListOfPersons(PersonResponseModel data) {
    List<PersonModel> persons = data.persons;
    if (persons.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "No more persons",
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      );
    } else {
      return ListView.builder(
          itemCount: persons.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: GestureDetector(
                      onTap: () {},
                      child: Row(children: [
                        Container(
                            child: CircleAvatar(
                          radius: 37,
                          backgroundImage: NetworkImage(persons[index].image),
                        )),
                        SizedBox(
                          width: 18,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                persons[index].status == "Alive"
                                    ? "ЖИВОЙ"
                                    : "МЕРТВЫЙ",
                                style: persons[index].status == "Alive"
                                    ? TextThemes.statusTextSttleGreen
                                    : TextThemes.statusTextSttleRed),
                            Text('${persons[index].name}',
                                style: TextThemes.namePersonTextStyle),
                            Text(
                                '${persons[index].species == "Human" ? "Человек" : "Животное"}, ${persons[index].gender == "Male" ? "Мужчина" : "Женщина"}',
                                style: TextThemes.genderPersonTextStyle),
                          ],
                        )
                      ])),
                ),
              ],
            );
          });
    }
  }

  Widget _buildGridOfPersons(PersonResponseModel data) {
    List<PersonModel> persons = data.persons;
    if (persons.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "No more persons",
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      );
    } else
      return GridView.builder(
          itemCount: persons.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              crossAxisCount: 2,
              childAspectRatio: 0.8),
          itemBuilder: (context, index) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                        child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(persons[index].image),
                    )),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(
                            persons[index].status == "Alive"
                                ? "ЖИВОЙ"
                                : "МЕРТВЫЙ",
                            style: persons[index].status == "Alive"
                                ? TextThemes.statusTextSttleGreen
                                : TextThemes.statusTextSttleRed),
                        Text('${persons[index].name}',
                            style: TextThemes.namePersonTextStyle),
                        Text(
                            '${persons[index].species == "Human" ? "Человек" : "Животное"}, ${persons[index].gender == "Male" ? "Мужчина" : "Женщина"}',
                            style: TextThemes.genderPersonTextStyle),
                      ],
                    ),
                  ),
                ]);
          });
  }
}
