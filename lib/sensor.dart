import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class SensorStatus extends StatelessWidget {
  //const SensorStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 372,
      height: 65,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(31),
          topRight: Radius.circular(31),
          bottomLeft: Radius.circular(31),
          bottomRight: Radius.circular(31),
        ),
        color: Color.fromRGBO(69, 70, 107, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 198,
            left: 49,
            child: Text(
              'Sensor Status',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.8399999737739563),
                fontFamily: 'WorkSans',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: 168,
            left: 263,
            child: Text(
              'Connected',
              style: TextStyle(
                fontFamily: 'WorkSans',
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: 194,
            left: 271,
            child: SvgPicture.asset(
              'assets/images/vector16.svg',
              semanticsLabel: 'vector16',
            ),
          ),
        ],
      ),
    );
  }
}
