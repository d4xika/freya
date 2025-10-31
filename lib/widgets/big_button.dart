// big_button.dart
import 'package:flutter/material.dart';
import '/constants/colors.dart';
import '/constants/styles.dart';

class BigButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const BigButton({super.key, required this.text, this.onPressed}); 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed, 
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
