import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class MotorSwitch extends StatelessWidget {
  bool _isSwitched = false;
  double add_height = 45;
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
                  //color: Color.fromRGBO(69, 70, 107, 1),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [                                                                                                    
                        Color.fromRGBO(4, 70, 168, 0.745),
                        Color.fromRGBO(5, 32, 86, 1),
                        Color.fromRGBO(4, 24, 65, 1),
                        Color.fromRGBO(1, 8, 27, 1)
                      ]),
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

      // Figma Flutter Generator Group13Widget - GROUP
 /*     Container(
      width: 390,
      height: 844,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
      width: 390,
      height: 844,
      decoration: BoxDecoration(
          color : Color.fromRGBO(0, 0, 0, 1),
  ),
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 428,
        left: 31,
        child: Container(
        width: 187,
        height: 224,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(31),
            topRight: Radius.circular(31),
            bottomLeft: Radius.circular(31),
            bottomRight: Radius.circular(31),
          ),
      gradient : LinearGradient(
          begin: Alignment(6.123234262925839e-17,1),
          end: Alignment(-1,6.123234262925839e-17),
          colors: [Color.fromRGBO(5, 105, 255, 0.75),Color.fromRGBO(9, 45, 116, 1),Color.fromRGBO(1, 17, 60, 1)]
        ),
  )
      )
      ),
        ]
      )
    )
      ),
        ]
      )
    )
    */