import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'mqtt_service.dart';
import 'main.dart';
import 'providers/mqtt_provider.dart';
class MotorSwitch extends ConsumerStatefulWidget {
  @override
  _MotorSwitchState createState() => _MotorSwitchState();
}

class _MotorSwitchState extends ConsumerState<MotorSwitch> {
  bool _isSwitched = true;
  double add_height = 65;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //Consumption Container

        Positioned(
            top: 668 + 57,
            left: 26,
            child: Container(
                width: 356,
                height: 92,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(31),
                    topRight: Radius.circular(31),
                    bottomLeft: Radius.circular(31),
                    bottomRight: Radius.circular(31),
                  ),
                  //color: Color.fromRGBO(69, 70, 107, 1),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(4, 70, 168, 0.745),
                        Color.fromRGBO(5, 32, 86, 1),
                        Color.fromRGBO(4, 24, 65, 1),
                        Color.fromRGBO(1, 8, 27, 1)
                      ]
                  ),
                ))),

        Positioned(
            top: 721 + add_height,
            left: 52,
            child: const Text(
              'Motor',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 18,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 669 + add_height,
            left: 42+10,
            child: Container(
                width: 57,
                height: 44,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Motor3.png'),
                      fit: BoxFit.fitWidth),
                )
            )
        ),
        Positioned(
          top: 680 + add_height,
          left: 250,
          child: LiteRollingSwitch(
            value: _isSwitched,
            width: 110,
            textOn: 'ON',
            textOff: 'OFF',
            colorOn: Colors.blueAccent.shade700,
            textOnColor: Colors.white,
            colorOff: Colors.grey,
            textOffColor: Colors.white,
            iconOn: Icons.power,
            iconOff: Icons.power_off,
            textSize: 14.0,

            // REQUIRED in v1.0.x
            onTap: () {},
            onDoubleTap: () {},
            onSwipe: () {},

            onChanged: (bool state) {
              setState(() {
                _isSwitched = state;
              });

              print('Motor is: $state');
              final mqttService = ref.read(mqttProvider);
              mqttService.publishMotorState(state);
            },
          ),
        ),
      ],
    );
  }
}


