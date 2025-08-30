import 'package:equatable/equatable.dart';

class StringCalculatorState extends Equatable {
  final int result;
  final bool isLoading;
  final String? errorMessage;

  const StringCalculatorState({
    this.result = 0,
    this.isLoading = false,
    this.errorMessage,
  });

  StringCalculatorState copyWith({
    int? result,
    bool? isLoading,
    String? errorMessage,
  }) {
    return StringCalculatorState(
      result: result ?? this.result,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [result, isLoading, errorMessage];
}