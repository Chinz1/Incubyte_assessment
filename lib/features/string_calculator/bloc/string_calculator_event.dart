part of 'string_calculator_bloc.dart';

abstract class StringCalculatorEvent {
  const StringCalculatorEvent();
}

class CalculateString extends StringCalculatorEvent {
  final String numbers;

  const CalculateString(this.numbers);
}