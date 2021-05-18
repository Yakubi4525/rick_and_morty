import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial());

  @override
  Stream<HomeScreenState> mapEventToState(
    HomeScreenEvent event,
  ) async* {
    switch (event.runtimeType) {
      case HomeListEvent:
        yield HomeScreenListState();
        break;

      case HomeGridEvent:
        yield HomeScreenGridState();
        break;
    }
  }
}
