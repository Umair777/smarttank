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
      ],
    );
  }
}
