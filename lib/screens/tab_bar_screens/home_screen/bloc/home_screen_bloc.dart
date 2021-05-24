import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/network/repository.dart';
import 'package:rick_and_morty/recources/variables.dart';
import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/home_models/person_response.dart';
part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial());
  bool isGrid = false;
  PersonResponseModel models;

  @override
  Stream<HomeScreenState> mapEventToState(
    HomeScreenEvent event,
  ) async* {
    switch (event.runtimeType) {
      case InitialViewEvent:
        yield* _buildInitialEvent(event);
        break;

      case SelectedViewEvent:
        yield* _buildSelectedViewEvent(event);
        break;
    }
  }

  Stream<HomeScreenState> _buildInitialEvent(InitialViewEvent event) async* {
    final _dataService = DataRepository();
    Connectivity connectivity = Connectivity();

    yield HomeScreenLodaingState();
    try {
      ConnectivityResult connect = await connectivity.checkConnectivity();
      if (connect != ConnectivityResult.none) {
        final persons = await _dataService.getListOfPersons();
        models = persons;
        yield HomeScreenSuccesState(personList: persons, isGrid: isGrid);
      } else
        yield HomeScreenErrorState(error: Variables.errorMessage);
    } catch (errorValue) {
      yield HomeScreenErrorState(error: errorValue);
    }
  }

  Stream<HomeScreenState> _buildSelectedViewEvent(
      SelectedViewEvent event) async* {
    yield HomeScreenLodaingState();
    isGrid = !isGrid;
    yield HomeScreenSuccesState(personList: models, isGrid: isGrid);
  }
}
