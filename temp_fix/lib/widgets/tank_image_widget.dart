import 'package:flutter/material.dart';

class TankImageWidget extends StatelessWidget {

  final TextEditingController capacityController;

  const TankImageWidget({
    super.key,
    required this.capacityController,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 300,
      height: 280,

      child: Stack(
        children: [

          /// TANK IMAGE
          Positioned(
            left: 0,
            top: 32,
            child: Image.asset(
              'assets/images/overflow_tank.png',
              height: 250,
            ),
          ),

          /// CENTER INPUT
          Positioned(
            left: 40,
            top: 160,
            child: Row(
              children: [

                SizedBox(
                  width: 60,
                  child: TextField(
                    controller: capacityController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),

                // const SizedBox(width: 4),

                const Text(
                  "L",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,

                  ),
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
}