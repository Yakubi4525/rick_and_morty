import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/blocs/get_list_persons_blocs.dart';
import 'package:rick_and_morty/blocs/person_bloc_models.dart';
import 'package:rick_and_morty/global_bloc/global_bloc.dart';
import 'package:rick_and_morty/screens/global_screen.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/bloc/home_screen_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(providers: [
          // BlocProvider.value(
          //   value: BlocProvider.of<GlobalBloc>(context)..add(NavInitialEvent()),
          // ),
          BlocProvider(
            create: (context) => GlobalBloc()..add(NavInitialEvent()),
          ),
          BlocProvider(
            create: (context) => GetPersonsBloc()..add(LoadPersonEvent()),
          ),
          BlocProvider(
            create: (context) => HomeScreenBloc()..add(HomeListEvent()),
          ),
        ], child: GlobalScreen()));
  }
}
