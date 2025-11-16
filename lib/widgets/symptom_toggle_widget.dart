import 'package:flutter/material.dart';

class SymptomToggleWidget extends StatefulWidget {
  final String label;
  final bool initialValue;
  final Function(bool) onChanged;

  const SymptomToggleWidget({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<SymptomToggleWidget> createState() => _SymptomToggleWidgetState();
}

class _SymptomToggleWidgetState extends State<SymptomToggleWidget> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.initialValue;
  }

  void _updateValue(bool newValue) {
    setState(() {
      _isSelected = newValue;
    });
    widget.onChanged(_isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.label, style: Theme.of(context).textTheme.titleLarge),
        
        // ToggleButtons für Yes/No
        ToggleButtons(
          isSelected: [_isSelected, !_isSelected],
          onPressed: (index) {
            _updateValue(index == 0); // 0 = Yes, 1 = No
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
    );
  }
}