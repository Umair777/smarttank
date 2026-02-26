import 'package:flutter/material.dart';
import 'package:smarttank/motor_switch.dart';
import 'package:smarttank/savings.dart';
import 'package:smarttank/sensor.dart';
import 'package:smarttank/tank_level.dart';
import 'package:smarttank/water_animation.dart';
import 'background.dart';
import 'consumption_graph.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';
class Dashboard extends ConsumerStatefulWidget {
  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {

  @override
  void initState() {
    super.initState();

    // Register callback
    mqttService.onTankLevelReceived = (int level) {
      ref.read(tankLevelProvider.notifier).state = level;
    };
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
