import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/calculation_result.dart';
import '../repositories/string_calculator_repository.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class AddNumbers implements UseCase<CalculationResult, String> {
  final StringCalculatorRepository repository;

  AddNumbers(this.repository);

  @override
  Future<Either<Failure, CalculationResult>> call(String numbers) async {
    return await repository.add(numbers);
  }
}