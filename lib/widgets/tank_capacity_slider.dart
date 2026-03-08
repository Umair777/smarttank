import 'package:flutter/material.dart';

class TankCapacitySlider extends StatelessWidget {

  final double tankCapacity;
  final Function(double) onChanged;

  const TankCapacitySlider({
    super.key,
    required this.tankCapacity,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Slider(
          min: 0,
          max: 2000,
          divisions: 8,
          value: tankCapacity,
          label: "${tankCapacity.toInt()} L",
          onChanged: onChanged,
        ),

        const Text(
          "Total Tank Volume",
          style: TextStyle(color: Colors.white70),
        ),

      ],
    );
  }
}