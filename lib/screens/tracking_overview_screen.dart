import 'package:flutter/material.dart';
import '/widgets/tracking_calendar.dart';
import '/widgets/add_symptom_fab.dart';

class TrackingOverviewScreen extends StatelessWidget {
  const TrackingOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text('Calendar'),),
    
      floatingActionButton: const AddSymptomFAB(),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const TrackingCalendarLarge(),
        ),
      ),
    );
  }
}