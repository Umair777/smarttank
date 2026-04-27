import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../providers/device_provider.dart';

class MotorSwitch extends ConsumerWidget {
  const MotorSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceAsync = ref.watch(deviceProvider);

    double addHeight = 65;

    return Stack(
      children: <Widget>[

        /// Background Container
        Positioned(
          top: 668 + 57,
          left: 26,
          child: Container(
            width: 356,
            height: 92,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(31)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(4, 70, 168, 0.745),
                  Color.fromRGBO(5, 32, 86, 1),
                  Color.fromRGBO(4, 24, 65, 1),
                  Color.fromRGBO(1, 8, 27, 1),
                ],
              ),
            ),
          ),
        ),

        /// Title
        Positioned(
          top: 721 + addHeight,
          left: 42,
          child: const Text(
            'Motor Automation',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'WorkSans',
              fontSize: 16,
            ),
          ),
        ),

        /// Motor Icon
        Positioned(
          top: 669 + addHeight,
          left: 42,
          child: Container(
            width: 57,
            height: 44,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Motor3.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),

        /// 🔥 SWITCH (REALTIME)
        Positioned(
          top: 680 + addHeight,
          left: 250,
          child: deviceAsync.when(

            /// ✅ DATA
            data: (device) {
              if (device == null) {
                return const Text(
                  "No Device",
                  style: TextStyle(color: Colors.white),
                );
              }

              final isOn = device['motor_automation'] ?? false;
              final deviceId = device['id'];

              return LiteRollingSwitch(
                value: isOn,
                width: 110,
                textOn: 'AUTO',
                textOff: 'OFF',
                colorOn: Colors.blueAccent.shade700,
                textOnColor: Colors.white,
                colorOff: Colors.grey,
                textOffColor: Colors.white,
                iconOn: Icons.power,
                iconOff: Icons.power_off,
                textSize: 14.0,

                onChanged: (bool state) async {
                  final supabase = Supabase.instance.client;

                  try {
                    await supabase.from('devices').update({
                      'motor_automation': state,
                    }).eq('id', deviceId);

                    debugPrint("Motor automation updated: $state");

                  } catch (e) {
                    debugPrint("Error updating motor automation: $e");

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: $e")),
                    );
                  }
                },

                onTap: () {},
                onDoubleTap: () {},
                onSwipe: () {},
              );
            },

            /// ⏳ LOADING
            loading: () => const SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),

            /// ❌ ERROR
            error: (e, _) => Text(
              'Error',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}