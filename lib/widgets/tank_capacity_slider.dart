import 'package:flutter/material.dart';

class TankWidget extends StatelessWidget {

  final TextEditingController capacityController;

  const TankWidget({
    super.key,
    required this.capacityController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Stack(
          alignment: Alignment.center,
          children: [

            Image.asset(
              'assets/images/overflow_tank.png',
              height: 180,
            ),

            SizedBox(
              width: 90,
              child: TextField(
                controller: capacityController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}