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

                  /// IMAGE + HEIGHT SLIDER
                  SizedBox(
                    height: 200,
                    child: Stack(
                      children: [

                        /// TANK IMAGE CENTER
                        Align(
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [

                              Image.asset(
                                'assets/images/overflow_tank.png',
                                height: 180,
                              ),

                              /// CAPACITY INPUT IN CENTER
                              SizedBox(
                                width: 90,
                                child: TextField(
                                  controller: capacityController,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// VERTICAL HEIGHT SLIDER
                        Positioned(
                          right: -20,
                          top: 10,
                          bottom: 10,
                          child: Column(
                            children: [

                              const Text(
                                "Overflow Height",
                                style: TextStyle(color: Colors.white70, fontSize: 12),
                              ),

                              Expanded(
                                child: RotatedBox(
                                  quarterTurns: -1,
                                  child: Slider(
                                    min: 50,
                                    max: 300,
                                    value: tankHeight,
                                    onChanged: (value) {
                                      setState(() {
                                        tankHeight = value;
                                        heightController.text =
                                            value.toInt().toString();
                                      });
                                    },
                                  ),
                                ),
                              ),

                              Text(
                                "${tankHeight.toInt()} cm",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// CAPACITY SLIDER
                  const SizedBox(height: 20),

                  /// CAPACITY SLIDER
                  Slider(
                    min: 0,
                    max: 2000,
                    divisions: 8, // 0,250,500,750,1000,1250,1500,1750,2000
                    value: tankCapacity,
                    label: "${tankCapacity.toInt()} L",
                    onChanged: (value) {
                      setState(() {
                        tankCapacity = value;
                        capacityController.text =
                            value.toInt().toString();
                      });
                    },
                  ),

                  /// TANK VOLUME LABEL
                  const Text(
                    "Tank Volume",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
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