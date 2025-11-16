import 'package:flutter/material.dart';

class NotesInputWidget extends StatelessWidget {
  const NotesInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Notes", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: "Enter your notes here...",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}