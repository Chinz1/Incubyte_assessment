import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/features/string_calculator/data/datasources/string_calculator_data_source_impl.dart';

import '../../../../fixtures/string_calculator_fixtures.dart';

void main() {
  late StringCalculatorDataSourceImpl dataSource;

  setUp(() {
    dataSource = StringCalculatorDataSourceImpl();
  });

  group('add', () {
    test('should return 0 when string is empty', () {
      // Act
      final result = dataSource.add(StringCalculatorFixtures.emptyString);
      
      // Assert
      expect(result, 0);
    });

    test('should return the number itself when string contains single number', () {
      // Act
      final result = dataSource.add(StringCalculatorFixtures.singleNumber);
      
      // Assert
      expect(result, 1);
    });

    test('should return sum of two numbers', () {
      // Act
      final result = dataSource.add(StringCalculatorFixtures.twoNumbers);
      
      // Assert
      expect(result, 6);
    });

    test('should return sum of multiple numbers', () {
      // Act
      final result = dataSource.add(StringCalculatorFixtures.multipleNumbers);
      
      // Assert
      expect(result, 15);
    });

    test('should handle newlines between numbers', () {
      // Act
      final result = dataSource.add(StringCalculatorFixtures.numbersWithNewlines);
      
      // Assert
      expect(result, 6);
    });

    test('should handle custom delimiters', () {
      // Act
      final result = dataSource.add(StringCalculatorFixtures.customDelimiter);
      
      // Assert
      expect(result, 3);
    });

    test('should throw FormatException when negative numbers are present', () {
      // Act & Assert
      expect(
        () => dataSource.add(StringCalculatorFixtures.negativeNumbers),
        throwsA(isA<FormatException>()),
      );
    });

    test('should show all negative numbers in exception message', () {
      // Act & Assert
      expect(
        () => dataSource.add(StringCalculatorFixtures.negativeNumbers),
        throwsA(
          predicate(
            (e) => e is FormatException && e.message.contains('-2, -4'),
          ),
        ),
      );
    });
  });
}