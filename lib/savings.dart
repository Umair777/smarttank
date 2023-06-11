import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WaterSaving extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        
        //SAVINGS
        Positioned(
            top: 239,
            left: 20,
            child: Container(
                width: 372,
                height: 177,
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
