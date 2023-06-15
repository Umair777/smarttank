import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

double mapTankLevelToDuration(int tankLevel) {
  const double maxTankLevel = 100.0;
  const double maxDuration = 3.0;

  return (tankLevel / maxTankLevel) * maxDuration;
}

class TankLevel extends StatelessWidget {
  int tank_level = 50;

  @override
  Widget build(BuildContext context) {
    double tank_animation_duration = mapTankLevelToDuration(tank_level);

    return Stack(
      children: <Widget>[
        Positioned(
          top: 510,
          left: 290,
          child: Text(
            '$tank_level%',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.7),
              fontFamily: 'WorkSans',
              fontSize: 28,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1,
            ),
          ),
        ),
      ],
    );
  }
}
