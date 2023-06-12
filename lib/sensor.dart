import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SensorStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 165,
            left: 18,
            child: Container(
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
                ))),
        Positioned(
            top: 195,
            left: 298,
            child: Container(
                width: 5,
                height: 13,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(1),
                    topRight: Radius.circular(1),
                    bottomLeft: Radius.circular(1),
                    bottomRight: Radius.circular(1),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ))),
        const Positioned(
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
          top: 106,
          left: 38,
          child: Container(
            width: 85,
            height: 107,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Liquidlevelcontrolicon1.png'),
                fit: BoxFit.fitWidth,
                colorFilter: ColorFilter.mode(
                  Colors.white,
                  BlendMode.modulate,
                ),
              ),
            ),
          ),
        ),
        const Positioned(
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
        Positioned(
            top: 191,
            left: 310,
            child: Text(
              '85%',
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
