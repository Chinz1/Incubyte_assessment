import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:string_calculator/core/error/failures.dart';
import 'package:string_calculator/features/string_calculator/data/datasources/string_calculator_data_source.dart';
import 'package:string_calculator/features/string_calculator/data/repositories/string_calculator_repository_impl.dart';
import 'package:string_calculator/features/string_calculator/domain/entities/calculation_result.dart';

import '../../../../fixtures/string_calculator_fixtures.dart';

class MockStringCalculatorDataSource extends Mock
    implements StringCalculatorDataSource {}

void main() {
  late StringCalculatorRepositoryImpl repository;
  late MockStringCalculatorDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockStringCalculatorDataSource();
    repository = StringCalculatorRepositoryImpl(mockDataSource);
  });

  group('add', () {
    test('should return CalculationResult when data source returns successfully',
        () async {
      // Arrange
      when(() => mockDataSource.add(StringCalculatorFixtures.twoNumbers))
          .thenReturn(6);

      // Act
      final result = await repository.add(StringCalculatorFixtures.twoNumbers);

      // Assert
      expect(result, isA<Right<Failure, CalculationResult>>());
      result.fold(
        (failure) => fail('Expected success but got failure'),
        (calculationResult) => expect(calculationResult.result, 6),
      );
    });

    test('should return Failure when data source throws FormatException',
        () async {
      // Arrange
      when(() => mockDataSource.add(StringCalculatorFixtures.negativeNumbers))
          .thenThrow(FormatException('negative numbers not allowed'));

      // Act
      final result = await repository.add(StringCalculatorFixtures.negativeNumbers);

      // Assert
      expect(result, isA<Left<Failure, CalculationResult>>());
      result.fold(
        (failure) => expect(failure, isA<CalculationFailure>()),
        (calculationResult) => fail('Expected failure but got success'),
      );
    });
  });
}