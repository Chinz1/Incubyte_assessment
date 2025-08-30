import '../datasources/string_calculator_data_source.dart';

class StringCalculatorDataSourceImpl implements StringCalculatorDataSource {
  @override
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String numbersToProcess = numbers;

    // Check for custom delimiter
    if (numbers.startsWith('//')) {
      final delimiterEndIndex = numbers.indexOf('\n');
      if (delimiterEndIndex != -1) {
        delimiter = numbers.substring(2, delimiterEndIndex);
        numbersToProcess = numbers.substring(delimiterEndIndex + 1);
      }
    }

    // Replace newlines with delimiter
    numbersToProcess = numbersToProcess.replaceAll('\n', delimiter);

    // Split numbers
    final numberList = numbersToProcess.split(delimiter);

    // Parse and validate numbers
    final parsedNumbers = <int>[];
    final negativeNumbers = <int>[];

    for (final numStr in numberList) {
      if (numStr.isNotEmpty) {
        final number = int.parse(numStr);
        if (number < 0) {
          negativeNumbers.add(number);
        } else {
          parsedNumbers.add(number);
        }
      }
    }

    // Check for negative numbers
    if (negativeNumbers.isNotEmpty) {
      throw FormatException(
        'negative numbers not allowed ${negativeNumbers.join(', ')}',
      );
    }

    // Calculate sum
    return parsedNumbers.fold(0, (sum, number) => sum + number);
  }
}
