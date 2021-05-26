import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/recources/variables.dart';
import 'package:rick_and_morty/screens/person_deail_screen/bloc/person_screen_bloc.dart';
import 'package:rick_and_morty/screens/person_deail_screen/widgets/enter.dart';
import 'package:rick_and_morty/screens/person_deail_screen/widgets/episode.dart';
import 'package:rick_and_morty/screens/person_deail_screen/widgets/line_widget.dart';
import 'package:rick_and_morty/screens/person_deail_screen/widgets/person_about_widget.dart';
import 'package:rick_and_morty/screens/person_deail_screen/widgets/top_widgets_view.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/home_models/person.dart';
import 'package:rick_and_morty/components/error_widget.dart';
import 'package:rick_and_morty/components/loading_widget.dart';
import 'package:rick_and_morty/theme/color_theme.dart';
import 'package:rick_and_morty/theme/text_theme.dart';

class PersonScreen extends StatelessWidget {
  final PersonModel model;

  const PersonScreen({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonScreenBloc, PersonScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        Size size = MediaQuery.of(context).size;
        return state.maybeMap(
          initialState: (_) => CustomLoaderWidget(),
          loadingState: (_) => CustomLoaderWidget(),
          errorState: (_error) => CustomErrorWidget(error: _error.errorMessage),
          dataStat: (_data) => Scaffold(
            body: Container(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
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
                            height: 218,
                            color: ColorPalette.greyColor_1.withOpacity(0.65),
                          ),
                          Container(
                            width: size.width,
                            color: ColorPalette.darkBlue,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 90,
                                ),
                                Text(model.name,
                                    style: TextThemes.tittlTextStyle),
                                const SizedBox(height: 4),
                                Text(
                                  model.status == "Alive" ? "ЖИВОЙ" : "МЕРТВЫЙ",
                                  style: model.status == "Alive"
                                      ? TextThemes.statusTextSttleRed.copyWith(
                                          color: ColorPalette.greenColor,
                                        )
                                      : TextThemes.statusTextSttleRed,
                                ),
                                const SizedBox(
                                  height: 36,
                                ),
                                PersonAboutWidget(model: model),
                                LineWidget(),
                                Episodes(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      TopWidgetsView(
                        imageUrl: model.image,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          orElse: () {},
        );
      },
    );
  }
}
