import 'package:flutter/material.dart';

class MoodSliderWidget extends StatefulWidget {
  final double initialValue;
  final Function(double) onChanged;

  const MoodSliderWidget({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<MoodSliderWidget> createState() => _MoodSliderWidgetState();
}

class _MoodSliderWidgetState extends State<MoodSliderWidget> {
  late double _currentValue;
  final List<IconData> _moodIcons = [
    Icons.sentiment_very_dissatisfied,   // 0-1
    Icons.sentiment_dissatisfied,        // 2-3
    Icons.sentiment_neutral,             // 4-6
    Icons.sentiment_satisfied,           // 7-8
    Icons.sentiment_very_satisfied,     // 9-10
  ];

  IconData get currentIcon {
    if (_currentValue <= 1) return _moodIcons[0];
    if (_currentValue <= 3) return _moodIcons[1];
    if (_currentValue <= 6) return _moodIcons[2];
    if (_currentValue <= 8) return _moodIcons[3];
    return _moodIcons[4];
  }

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              currentIcon,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Slider(
          value: _currentValue,
          min: 0,
          max: 10,
          divisions: 10,
          label: _currentValue.toInt().toString(),
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Colors.grey.shade300,
          onChanged: (newValue) {
            setState(() {
              _currentValue = newValue;
            });
            widget.onChanged(newValue);
          },
        ),
      ],
    );
  }
}