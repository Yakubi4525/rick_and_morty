part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent {}

class InitialViewEvent extends HomeScreenEvent{}

class SelectedViewEvent extends HomeScreenEvent{}



