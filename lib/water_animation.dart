import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'tank_level.dart';

double mapTankLevelToDuration(double tankLevel) {
  const double maxTankLevel = 100;
  const double maxDuration = 3000;

  return (tankLevel / maxTankLevel) * maxDuration;
}

class WaterUpdater extends StatefulWidget {
  const WaterUpdater({Key? key}) : super(key: key);

  @override
  _WaterUpdaterState createState() => _WaterUpdaterState();
}

class _WaterUpdaterState extends State<WaterUpdater> {
  Artboard? _artboard;
  SimpleAnimation? _fillingAnimation;
  bool _isFilling = false;

  Timer? _animationTimer;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  Future<void> _loadRiveFile() async {
    final bytes = await DefaultAssetBundle.of(context)
        .load('assets/animations/smarttank.riv');
    final file = RiveFile.import(bytes);
    final artboard = file.mainArtboard;

    setState(() {
      _artboard = artboard;
      _fillingAnimation = SimpleAnimation('Filling');
      _artboard!.addController(_fillingAnimation!);
    });
  }

  void _resetAnimation() {
    _fillingAnimation?.reset();
  }

  void _startAnimation(WidgetRef ref) {
    _fillingAnimation?.isActive = true;
    _animationTimer?.cancel();

    final tankLevel = ref.watch(tankLevelProvider);

    double tankAnimationDuration = mapTankLevelToDuration(tankLevel as double);
    _animationTimer = Timer(
      Duration(milliseconds: tankAnimationDuration.toInt()),
      () {
        setState(() {
          _fillingAnimation?.isActive = false;
        });
      },
    );
  }

  @override
  void dispose() {
    _animationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        ref.listen<int>(tankLevelProvider, (prevTankLevel, tankLevel) {
          // Handle provider value changes, if needed
        });

        return Row(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Positioned(
                    top: 444,
                    left: 57,
                    child: Container(
                      width: 530,
                      height: 330,
                      child: _artboard != null
                          ? GestureDetector(
                              onTap: () {
                                _resetAnimation();
                                _startAnimation(ref);
                              },
                              child: RiveAnimation.asset(
                                'assets/animations/smarttank.riv',
                                artboard: _artboard!.name,
                                fit: BoxFit.cover,
                                controllers: [_fillingAnimation!],
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                  Positioned(
                    top: 703,
                    left: 171,
                    child: const Text(
                      'Tap to refresh',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'WorkSans',
                        fontSize: 12,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
