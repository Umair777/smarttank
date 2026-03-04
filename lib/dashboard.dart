import 'package:flutter/material.dart';
import 'package:smarttank/motor_switch.dart';
import 'package:smarttank/providers/mqtt_provider.dart';
import 'package:smarttank/savings.dart';
import 'package:smarttank/sensor.dart';
import 'package:smarttank/tank_level.dart';
import 'package:smarttank/water_animation.dart';
import 'background.dart';
import 'consumption_graph.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_page.dart';
import 'mqtt_service.dart';


import 'main.dart';
class Dashboard extends ConsumerStatefulWidget {
  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  late MQTTService mqttService;
  @override
  void initState() {
    super.initState();

    // Get provider instance
    mqttService = ref.read(mqttProvider);

    _initializeMQTT();
  }

  // Register callback
  Future<void> _initializeMQTT() async {
    await mqttService.connect();
    mqttService.subscribeTankLevel();

    mqttService.onTankLevelReceived = (int level) {
      ref.read(tankLevelProvider.notifier).state = level;
    };
  }
  @override
  void dispose() {
    mqttService.client.disconnect(); // 🔥 Prevent memory leaks
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

      return Material(
        child: Center(
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    //WIDGET STACK
                    child: Stack(
                      children: <Widget>[
                        Background(),
                        SensorStatus(),
                        // Adding the SensorStatus widget here
                        WaterSaving(),
                        WaterConsumption(),
                        MotorSwitch(),

                        WaterUpdater(),
                        TankLevel(),
                        // Provide the animationDuration value here
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: IconButton(
                    icon: const Icon(Icons.logout, color: Colors.white),
                    onPressed: () async {
                      await Supabase.instance.client.auth.signOut();

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => LoginPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

// class Dashboard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Center(
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: Stack(
//             children: <Widget>[
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height,
//                   decoration: const BoxDecoration(
//                     color: Color.fromRGBO(0, 0, 0, 1),
//                   ),
//                   //WIDGET STACK
//                   child: Stack(
//                     children: <Widget>[
//                       Background(),
//                       SensorStatus(), // Adding the SensorStatus widget here
//                       WaterSaving(),
//                       WaterConsumption(),
//                       MotorSwitch(),
//                       TankLevel(),
//                       WaterUpdater(), // Provide the animationDuration value here
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
