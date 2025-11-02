import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool isMainTitle;

  const SectionTitle({
    super.key,
    required this.title,
    this.isMainTitle = false, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: isMainTitle ? 28 : 20, 
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}