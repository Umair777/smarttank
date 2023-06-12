import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class WaterSaving extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //SAVINGS
        Positioned(
            top: 239,
            left: 20,
            child: Container(
                width: 372,
                height: 177,
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
            top: 247,
            left: 119,
            child: Text(
              'Savings + Benefits',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'WorkSans',
                fontSize: 16,
                /*percentages not used in flutter. defaulting to zero*/
                fontWeight: FontWeight.w600,
              ),
            )),

        Positioned(
            top: 610,
            left: 51,
            child: Transform.rotate(
              angle: 90 * (math.pi / 180),
              child: const Divider(
                  color: Color.fromRGBO(144, 202, 255, 1),
                  thickness: 1.7999999523162842),
            )),
        Positioned(
            top: 563,
            left: 85,
            child: Transform.rotate(
              angle: 90.00000000000001 * (math.pi / 180),
              child: const Divider(
                  color: Color.fromRGBO(144, 202, 255, 1),
                  thickness: 1.7999999523162842),
            )),
        Positioned(
            top: 592,
            left: 117,
            child: Transform.rotate(
              angle: 90.00000000000001 * (math.pi / 180),
              child: const Divider(
                  color: Color.fromRGBO(144, 202, 255, 1),
                  thickness: 1.7999999523162842),
            )),
        Positioned(
            top: 578,
            left: 153,
            child: Transform.rotate(
              angle: 90 * (math.pi / 180),
              child: Divider(
                  color: Color.fromRGBO(144, 202, 255, 1),
                  thickness: 1.7999999523162842),
            )),
        Positioned(
            top: 593,
            left: 187,
            child: Transform.rotate(
              angle: 90 * (math.pi / 180),
              child: Divider(
                  color: Color.fromRGBO(144, 202, 255, 1),
                  thickness: 1.7999999523162842),
            )),
        Positioned(
          top: 274,
          left: 116,
          child: SvgPicture.asset('assets/images/ellipse16.svg',
              semanticsLabel: 'ellipse16'),
        ),
        Positioned(
          top: 373,
          left: 184,
          child: SvgPicture.asset('assets/images/vector13.svg',
              semanticsLabel: 'vector13'),
        ),
        Positioned(
          top: 295,
          left: 241,
          child: SvgPicture.asset('assets/images/vector14.svg',
              semanticsLabel: 'vector14'),
        ),

        Positioned(
          top: 304,
          left: 104,
          child: SvgPicture.asset('assets/images/vector15.svg',
              semanticsLabel: 'vector15'),
        ),
        Positioned(
            top: 292,
            left: 161,
            child: Container(
                width: 55,
                height: 75,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Saveearth1.png'),
                      fit: BoxFit.fitWidth),
                ))),

        Positioned(
            top: 367,
            left: 245,
            child: Text(
              'Water',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 15,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 309,
            left: 49,
            child: Text(
              'CO2\nEmission',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 15,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 299,
            left: 281,
            child: Text(
              'Electricity',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 15,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 321,
            left: 283,
            child: Text(
              '1.6 kW',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 16,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 386,
            left: 245,
            child: Text(
              '4.5 kL',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 16,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 344,
            left: 52,
            child: Text(
              '2.5 kg',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 16,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
      ],
    );
  }
}
