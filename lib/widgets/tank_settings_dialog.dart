import 'package:flutter/material.dart';
import 'package:smarttank/widgets/tank_image_widget.dart';
import 'tank_capacity_slider.dart';
import 'overflow_height_scale.dart';

void showTankSettingsDialog(BuildContext context) {

  double tankCapacity = 500;
  double tankHeight = 10;

  final TextEditingController capacityController =
  TextEditingController(text: tankCapacity.toInt().toString());

  final TextEditingController heightController =
  TextEditingController(text: tankHeight.toInt().toString());

  showDialog(
    context: context,
    builder: (context) {

      return StatefulBuilder(
        builder: (context, setState) {

          return AlertDialog(
            backgroundColor: const Color.fromRGBO(10, 18, 40, 1),

            title: const Text(
              "Tank Settings",
              style: TextStyle(color: Colors.white),
            ),

            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                /// TANK + HEIGHT SCALE
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    TankImageWidget(
                      capacityController: capacityController,
                    ),

                    const SizedBox(width: 20),

                    OverflowHeightScale(
                      heightController: heightController,
                      heightValue: tankHeight,
                      onChanged: (h) {
                        setState(() {
                          tankHeight = h;
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// VOLUME SLIDER
                TankCapacitySlider(
                  tankCapacity: tankCapacity,
                  onChanged: (value) {
                    setState(() {
                      tankCapacity = value;
                      capacityController.text = value.toInt().toString();
                    });
                  },
                ),

                // const Text(
                //   "Tank Volume",
                //   style: TextStyle(
                //     color: Colors.white70,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),

            actions: [

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),

              ElevatedButton(
                onPressed: () {

                  /// Save logic can be added here
                  /// Example:
                  /// saveTankSettings(tankCapacity, tankHeight);

                  Navigator.pop(context);
                },
                child: const Text("Save"),
              )
            ],
          );
        },
      );
    },
  );
}