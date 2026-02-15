import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WaterConsumption extends StatelessWidget {
  double add_height = 27;
  double add_width = 1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //Consumption Container
        // Positioned(
        //     top: 668 + add_height,
        //     left: 107,
        //     child: Container(
        //         width: 170,
        //         height: 30,
        //         decoration: const BoxDecoration(
        //           borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(31),
        //             topRight: Radius.circular(31),
        //             bottomLeft: Radius.circular(31),
        //             bottomRight: Radius.circular(31),
        //           ),
        //           //color: Color.fromRGBO(69, 70, 107, 1),
        //           gradient: LinearGradient(
        //               begin: Alignment.topCenter,
        //               end: Alignment.bottomCenter,
        //               colors: [
        //                 Color.fromRGBO(4, 74, 179, 0.737),
        //                 Color.fromRGBO(5, 32, 86, 1),
        //                 Color.fromRGBO(4, 24, 65, 1),
        //                 Color.fromRGBO(1, 8, 27, 1)
        //               ]),
        //         ))),
        Positioned(
            top: 409 + add_height,
            left: 23 + add_width,
            child: Container(
                width: 205,
                height: 254,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(31),
                    topRight: Radius.circular(31),
                    bottomLeft: Radius.circular(31),
                    bottomRight: Radius.circular(31),
                  ),
                  //color: Color.fromRGBO(69, 70, 107, 1),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(4, 70, 168, 0.745),
                        Color.fromRGBO(5, 32, 86, 1),
                        Color.fromRGBO(4, 24, 65, 1),
                        Color.fromRGBO(1, 8, 27, 1)
                      ]),
                ))),
        Positioned(
            top: 425 + add_height,
            left: 46 + add_width,
            child: Text(
              'Water Consumption',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            )),
        Positioned(
            top: 483 + add_height,
            left: 64 + add_width,
            child: Text(
              'Today',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Work Sans',
                  fontSize: 10,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 496 + add_height,
            left: 64 + add_width,
            child: Text(
              '540 L',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Work Sans',
                  fontSize: 16,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 592 + add_height,
            left: 46 + add_width,
            child: Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(134, 195, 250, 1),
                  border: Border.all(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(9, 9)),
                ))),
        Positioned(
            top: 560 + add_height,
            left: 80 + add_width,
            child: Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(134, 195, 250, 1),
                  border: Border.all(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(9, 9)),
                ))),
        Positioned(
            top: 551 + add_height,
            left: 128 + add_width,
            child: Container(
                width: 16,
                height: 18,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(75, 146, 209, 1),
                  border: Border.all(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    width: 4,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(16, 18)),
                ))),
        Positioned(
            top: 551 + add_height,
            left: 112 + add_width,
            child: Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(134, 195, 250, 1),
                  border: Border.all(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(9, 9)),
                ))),
        Positioned(
            top: 573 + add_height,
            left: 148 + add_width,
            child: Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(134, 195, 250, 1),
                  border: Border.all(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(9, 9)),
                ))),
        Positioned(
            top: 592 + add_height,
            left: 182 + add_width,
            child: Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(134, 195, 250, 1),
                  border: Border.all(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(9, 9)),
                ))),
        Positioned(
            top: 625 + add_height,
            left: 43 + add_width,
            child: Text(
              '12am',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 8,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 626 + add_height,
            left: 76 + add_width,
            child: Text(
              '6am',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 8,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 626 + add_height,
            left: 109 + add_width,
            child: Text(
              '12pm',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 8,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 625 + add_height,
            left: 141 + add_width,
            child: Text(
              '6pm',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 8,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 625 + add_height,
            left: 177 + add_width,
            child: Text(
              '12am',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 8,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 497 + add_height,
            left: 138 + add_width,
            child: Text(
              '25 kL',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Work Sans',
                  fontSize: 16,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 486 + add_height,
            left: 137 + add_width,
            child: Text(
              'Monthly',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 10,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
      ],
    );
  }
}
