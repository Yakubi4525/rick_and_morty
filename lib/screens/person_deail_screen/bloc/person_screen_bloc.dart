import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/home_models/person.dart';

part 'person_screen_event.dart';
part 'person_screen_state.dart';

part 'person_screen_bloc.freezed.dart';

class PersonScreenBloc extends Bloc<PersonScreenEvent, PersonScreenState> {
  PersonScreenBloc() : super(PersonScreenState.initialState());

  @override
  Stream<PersonScreenState> mapEventToState(
    PersonScreenEvent event,
  ) async* {
    yield* event.map(
        initalEvent: _mapInitialPeronEvent,
        loadPersonInfoEvent: _mapLoadPersonInfo);
  }

  Stream<PersonScreenState> _mapInitialPeronEvent(_InitialEvent event) async* {
    yield PersonScreenState.loadingState();
    try {
      ///Тут не правильно сделано, так как у нас пока нет реальних данных с api
      ///Когда мы будем работать с api я тут исправлю :)
      ///В качестве параметра в dataStat я буду передавать модельку полученную из api
      await Future.delayed(Duration(seconds: 1));
      //TODO Сделать запрос на получения модельки 
      PersonModel model = new PersonModel();
      yield PersonScreenState.dataStat(model: model);
    } catch (error) {
      yield PersonScreenState.errorState(errorMessage: error.toString());
    }
  }

  Stream<PersonScreenState> _mapLoadPersonInfo(
      _LoadPersonInfoEvent evevnt) async* {
    yield PersonScreenState.loadingState();
    try {} catch (error) {
      yield PersonScreenState.errorState(errorMessage: error.toString());
    }
  }
}
