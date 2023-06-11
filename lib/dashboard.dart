import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(21, 23, 45, 1),
                  ),
                  child: Stack(
                    children: <Widget>[
                      //Move to Sensor.dart
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
                          ),
                        ),
                      ),
                      //Move to Sensor.dart till here
                      const Positioned(
                          top: 198,
                          left: 49,
                          child: Text(
                            'Sensor Status',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromRGBO(
                                  255, 255, 255, 0.8399999737739563),
                              fontFamily: 'WorkSans',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      //Move to Sensor.dart till here
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
                        child: SvgPicture.asset('assets/images/vector16.svg',
                            semanticsLabel: 'vector16'),
                      ),
                      //Move to Sensor.dart till here
                      Positioned(
                        top: 106,
                        left: 38,
                        child: Container(
                          width: 85,
                          height: 107,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Liquidlevelcontrolicon1.png'),
                              fit: BoxFit.fitWidth,
                              colorFilter: ColorFilter.mode(Colors.white,
                                  BlendMode.modulate), // Apply color filter
                            ),
                          ),
                        ),
                      ),

                      ///Keep it here in dashbord.dart
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

                      ///Keep it here in dashbord.dart
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
                      //Keep it here in dashbord.dart
                      const Positioned(
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
