import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/calculation_result.dart';
import '../../domain/repositories/string_calculator_repository.dart';
import '../datasources/string_calculator_data_source.dart';

class StringCalculatorRepositoryImpl implements StringCalculatorRepository {
  final StringCalculatorDataSource dataSource;

  StringCalculatorRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, CalculationResult>> add(String numbers) async {
    try {
      final result = dataSource.add(numbers);
      return Right(CalculationResult(result: result));
    } on FormatException catch (e) {
      return Left(CalculationFailure(e.message));
    } catch (e) {
      return Left(CalculationFailure('Unexpected error occurred'));
    }
  }
}
