import 'package:flutter/material.dart';

class FlowIconWidget extends StatefulWidget {
  final Function(int) onFlowSelected;

  const FlowIconWidget({super.key, required this.onFlowSelected});

  @override
  State<FlowIconWidget> createState() => _FlowIconWidgetState();
}

class _FlowIconWidgetState extends State<FlowIconWidget> {
  int _selectedIndex = -1;

  final List<IconData> _flowIcons = [
    Icons.water_drop_outlined, 
    Icons.opacity,
    Icons.water_drop,                     
  ];

  final List<String> _labels = [
    "Light",
    "Mid",
    "Heavy",
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_flowIcons.length, (index) {
            bool isSelected = _selectedIndex == index;
            return Column(
              children: [
                IconButton(
                  iconSize: 35,
                  icon: Icon(_flowIcons[index]),
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.grey.shade400,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    widget.onFlowSelected(index);
                  },
                ),
                Text(
                  _labels[index],
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade400,
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}