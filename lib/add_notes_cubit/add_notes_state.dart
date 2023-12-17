abstract class MyState {}

class InitalState extends MyState {}

class LoadingSatate extends MyState {}

class SuccessState extends MyState {}

class FailureState extends MyState {
  final String errorMessage;
  FailureState(this.errorMessage);
}
