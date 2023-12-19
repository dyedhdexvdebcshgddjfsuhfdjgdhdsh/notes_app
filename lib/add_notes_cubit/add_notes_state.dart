abstract class MyState {}

class InitalState extends MyState {}

class AddNotesLoadingSatate extends MyState {}

class AddNotesSuccessState extends MyState {}

class AddNotesFailureState extends MyState {
  final String errorMessage;
  AddNotesFailureState(this.errorMessage);
}
