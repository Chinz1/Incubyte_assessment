import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_calculator/features/string_calculator/bloc/string_calculator_state.dart';
import '../bloc/string_calculator_bloc.dart';

class StringCalculatorScreen extends StatelessWidget {
  const StringCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('String Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInputField(context),
            const SizedBox(height: 20),
            _buildResultDisplay(context),
            const SizedBox(height: 20),
            _buildCalculateButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Enter numbers (e.g., "1,2,3")',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        context.read<StringCalculatorBloc>().add(CalculateString(value));
      },
    );
  }

  Widget _buildResultDisplay(BuildContext context) {
    return BlocBuilder<StringCalculatorBloc, StringCalculatorState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const CircularProgressIndicator();
        }

        if (state.errorMessage != null) {
          return Text(
            'Error: ${state.errorMessage}',
            style: const TextStyle(color: Colors.red),
          );
        }

        return Text(
          'Result: ${state.result}',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        );
      },
    );
  }

  Widget _buildCalculateButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // The calculation is triggered automatically when input changes
        // This button could be used for manual calculation if needed
      },
      child: const Text('Calculate'),
    );
  }
}