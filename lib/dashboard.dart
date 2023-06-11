import 'package:flutter/material.dart';
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
                      Positioned(
                          top: 139,
                          left: 18,
                          child: Container(
                              width: 352,
                              height: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(31),
                                  topRight: Radius.circular(31),
                                  bottomLeft: Radius.circular(31),
                                  bottomRight: Radius.circular(31),
                                ),
                                color: Color.fromRGBO(69, 70, 107, 1),
                              ))),
                      Positioned(
                          top: 38,
                          left: 305,
                          child: Container(
                              width: 59,
                              height: 59,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/Pngegg1.png'),
                                    fit: BoxFit.fitWidth),
                              ))),
                      Positioned(
                          top: 83,
                          left: 28,
                          child: Text(
                            'Sunday 5:00 AM',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(241, 248, 255, 1),
                                fontFamily: 'Work Sans',
                                fontSize: 20,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          )),
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
