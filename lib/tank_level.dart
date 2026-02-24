import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tankLevelProvider = StateProvider<int>((ref) => 57);

class TankLevel extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tankLevel = ref.watch(tankLevelProvider);

    return Stack(
      children: <Widget>[
        Positioned(
          top: 510,
          left: 290,
          child: Text(
            '$tankLevel%',
            style: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.7),
              fontFamily: 'WorkSans',
              fontSize: 28,
            ),
          ),
        ),
      ],
    );
  }
}