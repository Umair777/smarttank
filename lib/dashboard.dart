import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:smarttank/motor_switch.dart';
import 'package:smarttank/savings.dart';
//import 'dart:math' as math;
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttank/sensor.dart';
import 'package:smarttank/tank_level.dart';
import 'package:smarttank/water_animation.dart';

import 'consumption_graph.dart';
//import 'sensor.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                  //WIDGET STACK
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 38,
                        left: 305,
                        child: Container(
                          width: 59,
                          height: 59,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/Pngegg1.png'),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 83,
                        left: 28,
                        child: Text(
                          'Sunday 5:00 AM',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(241, 248, 255, 1),
                            fontFamily: 'WorkSans',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 38,
                        left: 28,
                        child: Text(
                          'Good Morning',
                          style: TextStyle(
                            fontFamily: 'WorkSans',
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SensorStatus(), // Adding the SensorStatus widget here
                      WaterSaving(),
                      WaterConsumption(),
                      MotorSwitch(),
                      TankLevel(),
                      WaterUpdater(), // Provide the animationDuration value here
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
