part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLodaingState extends HomeScreenState {}

class HomeScreenErrorState extends HomeScreenState {
  final String error;

  HomeScreenErrorState({@required this.error});
}

class HomeScreenSuccesState extends HomeScreenState {
  final PersonResponseModel personList;
  final bool isGrid;

  HomeScreenSuccesState({@required this.personList, @required this.isGrid});
}
