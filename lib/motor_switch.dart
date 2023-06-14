import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class MotorSwitch extends StatelessWidget {
  bool _isSwitched = false;
  double add_height = 37;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //Consumption Container

        Positioned(
            top: 668 + add_height,
            left: 26,
            child: Container(
                width: 356,
                height: 89,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(31),
                    topRight: Radius.circular(31),
                    bottomLeft: Radius.circular(31),
                    bottomRight: Radius.circular(31),
                  ),
                  color: Color.fromRGBO(69, 70, 107, 1),
                ))),

        Positioned(
            top: 731 + add_height,
            left: 40,
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
            top: 726 + add_height,
            left: 320,
            child: const Text(
              'ON',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1),
            )),
        Positioned(
            top: 679 + add_height,
            left: 42,
            child: Container(
                width: 57,
                height: 44,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Motor3.png'),
                      fit: BoxFit.fitWidth),
                ))),

        // Positioned(
        //     top: 610,
        //     left: 51,
        //     child: Transform.rotate(
        //       angle: 90 * (math.pi / 180),
        //       child: Divider(
        //           color: Color.fromRGBO(144, 202, 255, 1),
        //           thickness: 1.7999999523162842),
        //     )),
      ],
    );
  }
}
