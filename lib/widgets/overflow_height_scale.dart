import 'package:flutter/material.dart';

class OverflowHeightScale extends StatelessWidget {

  final TextEditingController heightController;
  final double heightValue;
  final Function(double) onChanged;

  const OverflowHeightScale({
    super.key,
    required this.heightController,
    required this.heightValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        const Text(
          "Set Overflow Height",
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),

        const SizedBox(height: 6),

        SizedBox(
          width: 70,
          child: TextField(
            controller: heightController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              isDense: true,
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              double? h = double.tryParse(value);
              if (h != null) {
                onChanged(h);
              }
            },
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          height: 180,
          child: RotatedBox(
            quarterTurns: -1,
            child: Slider(
              min: 0,
              max: heightValue,
              value: heightValue,
              onChanged: null, // scale only
            ),
          ),
        ),
      ],
    );
  }
}