import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/period_icon.dart';
import '../widgets/mood_slider.dart';
import '../widgets/section_title.dart';
import '../widgets/big_button.dart'; 


class SymptomInputScreen extends StatefulWidget {
  final DateTime selectedDay;

  const SymptomInputScreen({super.key, required this.selectedDay});

  @override
  State<SymptomInputScreen> createState() => _SymptomInputScreenState();
}

class _SymptomInputScreenState extends State<SymptomInputScreen> {
  bool _period = false;
  double _moodLevel = 5; 
  bool _nicotin = false;
  bool _alcohol = false;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMMM y').format(widget.selectedDay);

    return Scaffold(
      appBar: AppBar(
        title: Text(formattedDate),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SectionTitle(title: "Period"),
                  ToggleButtons(
                    isSelected: [_period, !_period],
                    onPressed: (index) {
                      setState(() {
                        _period = (index == 0);
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    selectedColor: Colors.white,
                    fillColor: Theme.of(context).primaryColor,
                    color: Theme.of(context).primaryColor,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text("Yes"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text("No"),
                      ),
                    ],
                  ),
                ],
              ),
              
              if (_period)
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: FlowIconWidget(
                    onFlowSelected: (index) {
                    },
                  ),
                ),
              const Divider(height: 30),

              const SectionTitle(title: "Mood"),
              const SizedBox(height: 10),
              MoodSliderWidget(
                initialValue: _moodLevel,
                onChanged: (newValue) {
                  _moodLevel = newValue;
                },
              ),
              const Divider(height: 30),

              const SectionTitle(title: "Pain & Problems"),
              const SizedBox(height: 10),
              const Divider(height: 30),

              const SectionTitle(title: "Medication"),
              const SizedBox(height: 10),
              const Divider(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SectionTitle(title: "Nicotin"),
                  ToggleButtons(
                    isSelected: [_nicotin, !_nicotin],
                    onPressed: (index) {
                      setState(() {
                        _nicotin = (index == 0);
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    selectedColor: Colors.white,
                    fillColor: Theme.of(context).primaryColor,
                    color: Theme.of(context).primaryColor,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text("Yes"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text("No"),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SectionTitle(title: "Alcohol"),
                  ToggleButtons(
                    isSelected: [_alcohol, !_alcohol],
                    onPressed: (index) {
                      setState(() {
                        _alcohol = (index == 0);
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    selectedColor: Colors.white,
                    fillColor: Theme.of(context).primaryColor,
                    color: Theme.of(context).primaryColor,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text("Yes"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text("No"),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(height: 30),

              const SectionTitle(title: "Notes"),
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
              const SizedBox(height: 40),

              BigButton(
                text: "Save",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}