import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class WaterSaving extends StatelessWidget {
  double add_height = 8;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //SAVINGS
        Positioned(
            top: 239 + add_height,
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
        Positioned(
            top: 247 + add_height,
            left: 133,
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
        // Positioned(
        //             top: 274,
        //             left: 116,
        //             child: SvgPicture.asset('assets/images/ellipse16.svg',
        //                 semanticsLabel: 'ellipse16')),
        Positioned(
            top: 271 + add_height,
            left: 132,
            child: Container(
                width: 135,
                height: 135,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/circle.png'),
                      fit: BoxFit.fitWidth),
                ))),
        //WATER_DROP
        Positioned(
          top: 379 + add_height,
          left: 194,
          width: 15,
          height: 25,
          child: SvgPicture.asset('assets/images/vector13.svg',
              semanticsLabel: 'vector13'),
        ),
        //ELECTRICTY
        Positioned(
          top: 295 + add_height,
          left: 241,
          child: SvgPicture.asset('assets/images/vector14.svg',
              semanticsLabel: 'vector14'),
        ),

        Positioned(
            top: 305 + add_height,
            left: 177,
            child: Container(
                width: 45,
                height: 65,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Saveearth1.png'),
                      fit: BoxFit.fitWidth),
                ))),
        Positioned(
            top: 285 + add_height,
            left: 120,
            child: Container(
                width: 45,
                height: 65,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/cloud1.png'),
                      fit: BoxFit.fitWidth),
                ))),

        Positioned(
            top: 367 + add_height,
            left: 255,
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
            top: 309 + add_height,
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
            top: 299 + add_height,
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
            top: 321 + add_height,
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
            top: 386 + add_height,
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
            top: 344 + add_height,
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
