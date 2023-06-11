import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MotorSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //Consumption Container

        Positioned(
            top: 668,
            left: 26,
            child: Container(
                width: 372,
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
            top: 668,
            left: 26,
            child: Container(
                width: 341,
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
        const Positioned(
            top: 731,
            left: 40,
            child: Text(
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
        const Positioned(
            top: 726,
            left: 320,
            child: Text(
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
            top: 679,
            left: 42,
            child: Container(
                width: 57,
                height: 44,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Motor3.png'),
                      fit: BoxFit.fitWidth),
                ))),
      ],
    );
  }
}
