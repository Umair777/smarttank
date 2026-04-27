import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  /// 🔥 NEW: Device UID Controller
  final TextEditingController deviceIdController = TextEditingController();

  bool isLoading = false;
  String? error;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          Future<void> claimDevice() async {
            final supabase = Supabase.instance.client;
            final user = supabase.auth.currentUser;

            if (user == null) {
              setState(() {
                error = "User not logged in";
              });
              return;
            }

            final deviceUID = deviceIdController.text.trim();

            if (deviceUID.isEmpty) {
              setState(() {
                error = "Please enter device ID";
              });
              return;
            }

            setState(() {
              isLoading = true;
              error = null;
            });

            try {
              final response = await supabase
                  .from('devices')
                  .update({'owner_id': user.id})
                  .eq('device_uid', deviceUID)
                  //.isFilter('owner_id', null) // 🔐 prevent stealing
                  .select();

              if (response.isEmpty) {
                setState(() {
                  error = "Invalid or already claimed device";
                });
              } else {
                // ✅ Success
                if (context.mounted) {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Device connected successfully"),
                    ),
                  );
                }
              }
            } catch (e) {
              setState(() {
                error = e.toString();
              });
            }

            setState(() {
              isLoading = false;
            });
          }

          return AlertDialog(
            backgroundColor: const Color.fromRGBO(10, 18, 40, 1),

            title: const Text(
              "Tank Settings",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),

            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  /// 🔥 DEVICE ID INPUT
                  TextField(
                    controller: deviceIdController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: "Device UID",
                      labelStyle: TextStyle(color: Colors.white70),
                      hintText: "Enter your device ID",
                      hintStyle: TextStyle(color: Colors.white38),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white38),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// TANK + HEIGHT SCALE
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TankImageWidget(
                          capacityController: capacityController,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: OverflowHeightScale(
                          heightController: heightController,
                          heightValue: tankHeight,
                          onChanged: (h) {
                            setState(() {
                              tankHeight = h;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// CAPACITY SLIDER
                  TankCapacitySlider(
                    tankCapacity: tankCapacity,
                    onChanged: (value) {
                      setState(() {
                        tankCapacity = value;
                        capacityController.text =
                            value.toInt().toString();
                      });
                    },
                  ),

                  const SizedBox(height: 10),

                  /// ERROR MESSAGE
                  if (error != null)
                    Text(
                      error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),

            actions: [

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),

              ElevatedButton(
                onPressed: isLoading ? null : claimDevice,
                child: isLoading
                    ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
                    : const Text("Save & Connect"),
              ),
            ],
          );
        },
      );
    },
  );
}