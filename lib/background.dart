import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// double mapTankLevelToDuration(int tankLevel) {
//   const double maxTankLevel = 100.0;
//   const double maxDuration = 3.0;

//   return (tankLevel / maxTankLevel) * maxDuration;
// }

class Background extends StatelessWidget {
 // int tank_level = 50;

  @override
  Widget build(BuildContext context) {
    //double tank_animation_duration = mapTankLevelToDuration(tank_level);
    
    return Stack(
      children: <Widget>[
        Positioned(
                        top: 38,
                        left: 305,
                        child: Container(
                          width: 59,
                          height: 59,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/Pngegg1.png'),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 83,
                        left: 28,
                        child: Text(
                          'Sunday 5:00 AM',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(241, 248, 255, 1),
                            fontFamily: 'WorkSans',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 38,
                        left: 28,
                        child: Text(
                          'Good Morning',
                          style: TextStyle(
                            fontFamily: 'WorkSans',
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
      ],
    );
  }
}
