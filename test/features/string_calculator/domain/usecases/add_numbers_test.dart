import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:string_calculator/features/string_calculator/domain/entities/calculation_result.dart';
import 'package:string_calculator/features/string_calculator/domain/repositories/string_calculator_repository.dart';
import 'package:string_calculator/features/string_calculator/domain/usecases/add_numbers.dart';

class MockStringCalculatorRepository extends Mock
    implements StringCalculatorRepository {}

void main() {
  late AddNumbers useCase;
  late MockStringCalculatorRepository mockRepository;

  setUp(() {
    mockRepository = MockStringCalculatorRepository();
    useCase = AddNumbers(mockRepository);
  });

  const testNumbers = '1,2,3';
  final testCalculationResult = CalculationResult(result: 6);

  test('should get CalculationResult from the repository', () async {
    // Arrange
    when(() => mockRepository.add(testNumbers))
        .thenAnswer((_) async => Right(testCalculationResult));

    // Act
    final result = await useCase(testNumbers);

    // Assert
    expect(result, Right(testCalculationResult));
    verify(() => mockRepository.add(testNumbers));
    verifyNoMoreInteractions(mockRepository);
  });
}