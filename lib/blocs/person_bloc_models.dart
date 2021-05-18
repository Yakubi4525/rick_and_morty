import 'package:rick_and_morty/screens/tab_bar_screens/home_screen/home_models/person_response.dart';

abstract class PersonEvents {}

class LoadPersonEvent extends PersonEvents {}

class RefreshPageEvent extends PersonEvents {}

abstract class PersonStates {}

class LoadingPersonState extends PersonStates {}

class SuccesPersonState extends PersonStates {
  PersonResponseModel personResponse;
  SuccesPersonState({this.personResponse});
}

class FailedPersonState extends PersonStates {
  String error;
  FailedPersonState({this.error});
}

class NoInternetPersonState extends PersonStates {
  String message = 'Check your internet and try again!';
}
