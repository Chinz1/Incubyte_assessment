import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:string_calculator/core/error/failures.dart';
import 'package:string_calculator/features/string_calculator/bloc/string_calculator_bloc.dart';
import 'package:string_calculator/features/string_calculator/bloc/string_calculator_state.dart';
import 'package:string_calculator/features/string_calculator/domain/entities/calculation_result.dart';
import 'package:string_calculator/features/string_calculator/domain/usecases/add_numbers.dart';

class MockAddNumbers extends Mock implements AddNumbers {}

void main() {
  late MockAddNumbers mockAddNumbers;
  late StringCalculatorBloc bloc;

  setUp(() {
    mockAddNumbers = MockAddNumbers();
    bloc = StringCalculatorBloc(addNumbers: mockAddNumbers);
  });

  tearDown(() {
    bloc.close();
  });

  const testNumbers = '1,2,3';
  final testCalculationResult = CalculationResult(result: 6);

  blocTest<StringCalculatorBloc, StringCalculatorState>(
    'emits [loading, success] when CalculateString is added successfully',
    build: () {
      when(
        () => mockAddNumbers(testNumbers),
      ).thenAnswer((_) async => Right(testCalculationResult));
      return bloc;
    },
    act: (bloc) => bloc.add(const CalculateString(testNumbers)),
    expect:
        () => [
          const StringCalculatorState(isLoading: true, errorMessage: null),
          const StringCalculatorState(result: 6, isLoading: false),
        ],
  );

  blocTest<StringCalculatorBloc, StringCalculatorState>(
    'emits [loading, error] when CalculateString fails',
    build: () {
      when(() => mockAddNumbers(testNumbers)).thenAnswer(
        (_) async => Left(CalculationFailure('Negative numbers not allowed')),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const CalculateString(testNumbers)),
    expect:
        () => [
          const StringCalculatorState(isLoading: true, errorMessage: null),
          const StringCalculatorState(
            isLoading: false,
            errorMessage: 'Negative numbers not allowed',
          ),
        ],
  );
}
