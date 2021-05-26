part of 'person_screen_bloc.dart';

@freezed
abstract class PersonScreenEvent with _$PersonScreenEvent {
  const factory PersonScreenEvent.initalEvent() = _InitialEvent;
  const factory PersonScreenEvent.loadPersonInfoEvent() = _LoadPersonInfoEvent;
}
