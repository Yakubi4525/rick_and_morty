import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:rick_and_morty/components/error_widget.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/widgets/grid_builder_widget.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/widgets/input_widget.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/widgets/list_build_widget.dart';
import 'package:rick_and_morty/components/loading_widget.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/widgets/total_widget.dart';
import 'package:rick_and_morty/theme/color_theme.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  ScrollController scrollController = ScrollController();
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, homeState) {
        if (homeState is HomeScreenInitial) {
          return CustomLoaderWidget();
        }
        if (homeState is HomeScreenLodaingState) {
          return CustomLoaderWidget();
        }
        if (homeState is HomeScreenErrorState) {
          return CustomErrorWidget(
            error: homeState.error,
          );
        }
        if (homeState is HomeScreenSuccesState)
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                toolbarHeight: 130,
                title: CustomInputWidget(
                    screenSize: size, controller: textController),
                elevation: 0,
                backgroundColor: ColorPalette.darkBlue,
                automaticallyImplyLeading: false,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: CustomTotalWidget(
                    totalPersons:
                        homeState.personList.persons.length.toString(),
                    onPressButton: () {
                      context.read<HomeScreenBloc>()
                        ..add(
                          SelectedViewEvent(),
                        );
                      // BlocProvider.of<HomeScreenBloc>(context)
                      //     .add(SelectedViewEvent());
                    },
                  ),
                ),
              ),
              body: homeState.isGrid
                  ? BuildGridWidget(
                      persons: homeState.personList.persons,
                    )
                  : BuildListWidget(
                      persons: homeState.personList.persons,
                    ),
            ),
          );

        return Container();
      },
    );
  }
}
