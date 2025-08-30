import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:incubyte_tdd/injection_container.dart' as di;
import 'package:string_calculator/features/string_calculator/bloc/string_calculator_bloc.dart';
import 'package:string_calculator/features/string_calculator/presentation/string_calculator_screen.dart';
import 'package:string_calculator/injection_container.dart' as di;

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize dependency injection
  await di.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'String Calculator TDD',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => di.sl<StringCalculatorBloc>(),
        child:  StringCalculatorScreen(),
      ),
    );
  }
}