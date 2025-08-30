import 'package:get_it/get_it.dart';
import 'package:string_calculator/features/string_calculator/bloc/string_calculator_bloc.dart';
import 'package:string_calculator/features/string_calculator/data/datasources/string_calculator_data_source.dart';
import 'package:string_calculator/features/string_calculator/data/datasources/string_calculator_data_source_impl.dart';
import 'package:string_calculator/features/string_calculator/data/repositories/string_calculator_repository_impl.dart';
import 'package:string_calculator/features/string_calculator/domain/repositories/string_calculator_repository.dart';
import 'package:string_calculator/features/string_calculator/domain/usecases/add_numbers.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc - register as factory, not singleton
  sl.registerFactory(
    () => StringCalculatorBloc(addNumbers: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => AddNumbers(sl()));

  // Repository
  sl.registerLazySingleton<StringCalculatorRepository>(
    () => StringCalculatorRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<StringCalculatorDataSource>(
    () => StringCalculatorDataSourceImpl(),
  );
}