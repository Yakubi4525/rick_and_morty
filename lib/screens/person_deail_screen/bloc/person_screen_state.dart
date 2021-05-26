part of 'person_screen_bloc.dart';

@freezed
abstract class PersonScreenState with _$PersonScreenState {
  const factory PersonScreenState.initialState() = _InitialState;
  const factory PersonScreenState.loadingState() = _LoadingState;
  const factory PersonScreenState.errorState({@required String errorMessage}) = _ErrorStete;
  const factory PersonScreenState.dataStat({@required PersonModel model}) = _DatatState;
}
