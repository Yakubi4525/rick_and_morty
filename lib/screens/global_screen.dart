import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/global_bloc/global_bloc.dart';
import 'package:rick_and_morty/screens/splash_screen/screen.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/tap_bar_state.dart';

class GlobalScreen extends StatefulWidget {
  @override
  _GlobalScreenState createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
        builder: (context, screenState) {
      switch (screenState.runtimeType) {
        case GlobalInitial:
          return SplashScreen();
          break;
        case TapBarState:
          return TapBarScreen();
          break;
        default:
      }
    });
  }
}
