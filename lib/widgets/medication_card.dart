import 'package:flutter/material.dart';

class MedicationCard extends StatefulWidget {
  const MedicationCard({super.key});

  @override
  State<MedicationCard> createState() => _MedicationCardState();
}

class _MedicationCardState extends State<MedicationCard> {
  //medication list
  final List<Map<String, TextEditingController>> medications = [];

  void _addMedication() {
    setState(() {
      medications.add({
        'name': TextEditingController(),
        'reminder': TextEditingController(),
      });
    });
  }

  @override
  void dispose() {
    for (var med in medications) {
      med['name']?.dispose();
      med['reminder']?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Add Medication',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _addMedication,
              ),
            ],
          ),
        ),

        // medication list
        ...medications.map((med) {
          return Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              children: [
                TextField(
                  controller: med['name'],
                   readOnly: true,
  onTap: () async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      med['reminder']!.text = selectedTime.format(context);
    }
  },
  decoration: InputDecoration(
    labelText: 'Reminder Time',
    border: OutlineInputBorder(),
    suffixIcon: const Icon(Icons.access_time),
  ),
),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
