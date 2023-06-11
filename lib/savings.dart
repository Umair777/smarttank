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
        // Positioned(
        //     top: 610,
        //     left: 51,
        //     child: Transform.rotate(
        //       angle: 90 * (math.pi / 180),
        //       child: Divider(
        //           color: Color.fromRGBO(144, 202, 255, 1),
        //           //thickness: 1.7999999523162842
        //           thickness: 50),
        //     )),
        Positioned(
            top: 610,
            left: 51,
            child: Transform.rotate(
              angle: 90 * (math.pi / 180),
              child: Divider(
                  color: Color.fromRGBO(144, 202, 255, 1),
                  thickness: 1.7999999523162842),
            )),
        Positioned(
            top: 563,
            left: 85,
            child: Transform.rotate(
              angle: 90.00000000000001 * (math.pi / 180),
              child: Divider(
                  color: Color.fromRGBO(144, 202, 255, 1),
                  thickness: 1.7999999523162842),
            )),
        Positioned(
            top: 592,
            left: 117,
            child: Transform.rotate(
              angle: 90.00000000000001 * (math.pi / 180),
              child: Divider(
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
      ],
    );
  }
}
