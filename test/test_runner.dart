import 'package:flutter_test/flutter_test.dart';

// Import all your test files
import 'features/string_calculator/data/datasources/string_calculator_data_source_test.dart'
    as data_source_test;
import 'features/string_calculator/data/repositories/string_calculator_repository_impl_test.dart'
    as repository_test;
import 'features/string_calculator/domain/usecases/add_numbers_test.dart'
    as use_case_test;
import 'features/string_calculator/bloc/string_calculator_bloc_test.dart'  // Updated path
    as bloc_test;

void main() {
  group('String Calculator Tests', () {
    // Data source tests
    group('DataSource Tests', () {
      setUp(() {
        // Any setup needed for data source tests
      });

      // Run all data source tests
      data_source_test.main();
    });

    // Repository tests
    group('Repository Tests', () {
      setUp(() {
        // Any setup needed for repository tests
      });

      // Run all repository tests
      repository_test.main();
    });

    // Use case tests
    group('Use Case Tests', () {
      setUp(() {
        // Any setup needed for use case tests
      });

      // Run all use case tests
      use_case_test.main();
    });

    // BLoC tests
    group('BLoC Tests', () {
      setUp(() {
        // Any setup needed for BLoC tests
      });

      // Run all BLoC tests
      bloc_test.main();
    });
  });
}