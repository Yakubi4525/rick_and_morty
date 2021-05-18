import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(GlobalInitial());

  @override
  Stream<GlobalState> mapEventToState(
    GlobalEvent event,
  ) async* {
    switch (event.runtimeType) {
      case NavInitialEvent:
        await Future.delayed(Duration(seconds: 5));
        yield TapBarState();
        break;
    }
  }
}
