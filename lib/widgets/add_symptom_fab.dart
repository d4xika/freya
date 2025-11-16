import 'package:flutter/material.dart';
import '../screens/symptom_input_screen.dart';

class AddSymptomFAB extends StatelessWidget {
  final DateTime selectedDay;

  const AddSymptomFAB({
    super.key,
    required this.selectedDay,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => SymptomInputScreen(selectedDay: selectedDay),
          ),
        );
      },
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}