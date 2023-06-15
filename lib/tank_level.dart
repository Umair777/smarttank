import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

final tankLevelProvider = Provider<int>((ref) => 50);

class TankLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final tankLevel = watch.read(tankLevelProvider);

        return Stack(
          children: <Widget>[
            Positioned(
              top: 510,
              left: 290,
              child: Text(
                '$tankLevel%',
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
      },
    );
  }
}
