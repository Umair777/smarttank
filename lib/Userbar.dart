import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Userbar extends StatelessWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const Userbar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {

    var dateTime = DateTime.now();
    String formattedDate = DateFormat('EEEE h:mm a').format(dateTime);

    return Stack(
      children: [

        /// USER IMAGE (opens sidebar)
        Positioned(
          top: 48,
          left: MediaQuery.of(context).size.width - 70,
          child: GestureDetector(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
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
        ),

        /// DATE + TIME
        Positioned(
          top: 83,
          left: 28,
          child: Text(
            formattedDate,
            style: const TextStyle(
              color: Color.fromRGBO(241, 248, 255, 1),
              fontFamily: 'WorkSans',
              fontSize: 20,
            ),
          ),
        ),

        /// GREETING TEXT
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
    );
  }
}