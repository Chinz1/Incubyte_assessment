import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:string_calculator/features/string_calculator/bloc/string_calculator_state.dart';
import 'package:string_calculator/features/string_calculator/domain/usecases/add_numbers.dart' show AddNumbers;

import '../../../../core/error/failures.dart';

part 'string_calculator_event.dart';

class StringCalculatorBloc
    extends Bloc<StringCalculatorEvent, StringCalculatorState> {
  final AddNumbers addNumbers;

  StringCalculatorBloc({required this.addNumbers})
      : super(const StringCalculatorState()) {
    on<CalculateString>(_onCalculateString);
  }

  Future<void> _onCalculateString(
    CalculateString event,
    Emitter<StringCalculatorState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await addNumbers(event.numbers);

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        ),
      ),
      (calculationResult) => emit(
        state.copyWith(
          isLoading: false,
          result: calculationResult.result,
          errorMessage: calculationResult.errorMessage,
        ),
      ),
    );
  }
}