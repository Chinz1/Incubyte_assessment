class CalculationResult {
  final int result;
  final bool hasError;
  final String? errorMessage;

  CalculationResult({
    required this.result,
    this.hasError = false,
    this.errorMessage,
  });
}