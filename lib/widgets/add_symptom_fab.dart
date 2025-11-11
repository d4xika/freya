import 'package:flutter/material.dart';
import '/screens/symptom_input_screen.dart';

class AddSymptomFAB extends StatelessWidget {
  const AddSymptomFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const SymptomInputScreen(),
          ),
        );
      },
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}