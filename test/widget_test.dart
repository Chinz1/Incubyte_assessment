import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:string_calculator/features/string_calculator/bloc/string_calculator_bloc.dart';
import 'package:string_calculator/features/string_calculator/bloc/string_calculator_state.dart';
import 'package:string_calculator/features/string_calculator/presentation/string_calculator_screen.dart';
import 'package:string_calculator/main.dart';

class MockStringCalculatorBloc extends Mock implements StringCalculatorBloc {}

void main() {
  late MockStringCalculatorBloc mockBloc;

  setUp(() {
    mockBloc = MockStringCalculatorBloc();
    
    // Mock initial state
    when(() => mockBloc.state).thenReturn(const StringCalculatorState());
    when(() => mockBloc.stream).thenAnswer((_) => Stream.value(const StringCalculatorState()));
  });

  testWidgets('String calculator app loads', (WidgetTester tester) async {
    // Build our app with mocked dependencies
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<StringCalculatorBloc>.value(
          value: mockBloc,
          child: const StringCalculatorScreen(),
        ),
      ),
    );

    // Verify that our app starts with the correct title.
    expect(find.text('String Calculator'), findsOneWidget);
  });
}