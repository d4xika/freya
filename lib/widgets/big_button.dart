import 'package:flutter/material.dart';
import '/constants/colors.dart';
import '/constants/styles.dart';

class BigButton extends StatelessWidget {
  final String text;

  const BigButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24), // Abstand zu den Seiten
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {}, // leer, nur Layout
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(
            text,
            style: AppTextStyles.buttonText,
          ),
        ),
      ),
    );
  }
}
