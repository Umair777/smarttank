import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WaterAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 194,
          left: 271,
          child: SvgPicture.asset(
            'assets/images/vector16.svg',
            semanticsLabel: 'vector16',
          ),
        ),
        Positioned(
            top: 479,
            left: 276,
            child: Text(
              '50%',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 28,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        
        
      ],
    );
  }
}
