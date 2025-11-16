import 'package:flutter/material.dart';
import '../widgets/tracking_calendar.dart';
import '../widgets/add_symptom_fab.dart';

class TrackingOverviewScreen extends StatefulWidget {
  const TrackingOverviewScreen({super.key});

  @override
  State<TrackingOverviewScreen> createState() => _TrackingOverviewScreenState();
}

class _TrackingOverviewScreenState extends State<TrackingOverviewScreen> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar')),

      floatingActionButton: AddSymptomFAB(selectedDay: _selectedDay),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TrackingCalendarLarge(
            onDaySelected: (day) {
              setState(() {
                _selectedDay = day;
              });
            },
          ),
        ),
      ),
    );
  }
}