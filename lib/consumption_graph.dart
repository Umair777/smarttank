import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WaterConsumption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //Consumption Container
        Positioned(
            top: 428,
            left: 31,
            child: Container(
                width: 187,
                height: 224,
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
            top: 448,
            left: 57,
            child: Text(
              'Water Consumption',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'WorkSans',
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            )),
        Positioned(
            top: 483,
            left: 64,
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
            top: 496,
            left: 64,
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
            top: 592,
            left: 46,
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
            top: 560,
            left: 80,
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
            top: 551,
            left: 128,
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
            top: 551,
            left: 112,
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
            top: 573,
            left: 148,
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
            top: 592,
            left: 182,
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
            top: 625,
            left: 43,
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
            top: 626,
            left: 76,
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
            top: 626,
            left: 109,
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
            top: 625,
            left: 141,
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
            top: 625,
            left: 177,
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
            top: 497,
            left: 138,
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
            top: 486,
            left: 137,
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
