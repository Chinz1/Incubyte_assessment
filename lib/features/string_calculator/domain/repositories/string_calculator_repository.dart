import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/calculation_result.dart';

abstract class StringCalculatorRepository {
  Future<Either<Failure, CalculationResult>> add(String numbers);
}