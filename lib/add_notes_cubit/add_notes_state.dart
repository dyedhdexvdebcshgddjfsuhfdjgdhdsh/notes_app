abstract class State {}

class InitalState extends State {}

class LoadingSatate extends State {}

class SuccessState extends State {}

class FailureState extends State {
  final String errorMessage;
  FailureState(this.errorMessage);
}
