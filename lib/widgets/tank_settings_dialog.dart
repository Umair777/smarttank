import 'package:flutter/material.dart';


void showTankSettingsDialog(BuildContext context) {
  double tankCapacity = 500;
  double tankHeight = 180;

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

                /// ---------- TANK CAPACITY ----------
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tank Capacity",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: capacityController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text("L", style: TextStyle(color: Colors.white)),
                  ],
                ),

                Slider(
                  min: 250,
                  max: 1500,
                  value: tankCapacity,
                  onChanged: (value) {
                    setState(() {
                      tankCapacity = value;
                      capacityController.text = value.toInt().toString();
                    });
                  },
                ),

                const SizedBox(height: 20),

                /// ---------- TANK HEIGHT ----------
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tank Height",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: heightController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text("cm", style: TextStyle(color: Colors.white)),
                  ],
                ),

                Slider(
                  min: 50,
                  max: 300,
                  value: tankHeight,
                  onChanged: (value) {
                    setState(() {
                      tankHeight = value;
                      heightController.text = value.toInt().toString();
                    });
                  },
                ),
              ],
            ),

            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),

              ElevatedButton(
                onPressed: () {
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