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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      /// TANK IMAGE WITH CENTER INPUT
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [

                            Image.asset(
                              'assets/images/overflow_tank.png',   // your tank image
                              height: 180,
                            ),

                            /// CENTER CAPACITY INPUT
                            SizedBox(
                              width: 90,
                              child: TextField(
                                controller: capacityController,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white),
                                // decoration: const InputDecoration(
                                //   filled: false,
                                //   fillColor: Color.fromRGBO(0, 0, 0, 0.5),
                                  // border: OutlineInputBorder(),
                                // ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      /// HEIGHT SLIDER
                      Column(
                        children: [

                          RotatedBox(
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

                          Text(
                            "${tankHeight.toInt()} cm",
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// CAPACITY SLIDER
                  Slider(
                    min: 250,
                    max: 1500,
                    value: tankCapacity,
                    onChanged: (value) {
                      setState(() {
                        tankCapacity = value;
                        capacityController.text =
                            value.toInt().toString();
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