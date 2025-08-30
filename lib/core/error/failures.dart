abstract class Failure {
  final String message;

  Failure(this.message);
}

class CalculationFailure extends Failure {
  CalculationFailure(String message) : super(message);
}