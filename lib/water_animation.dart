import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'tank_level.dart';

double mapTankLevelToDuration(int tankLevel) {
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

  void _startAnimation(int tankLevel) {
    _fillingAnimation?.isActive = true;
    _animationTimer?.cancel();

    // final tankLevel = ref.watch(tankLevelProvider);
    // check what value we are receiving am getting in animation

    print('Tank Level in animation: $tankLevel');

    double tankAnimationDuration = mapTankLevelToDuration(tankLevel);
    print('Tank Level in milis: $tankAnimationDuration');
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
          if (prevTankLevel == tankLevel) return; //  prevent duplicate triggers
          // Handle provider value changes, if needed
          print("Tank changed: $tankLevel");
          _resetAnimation();
          _startAnimation(tankLevel);
        }
        );

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
                                final currentLevel = ref.read(tankLevelProvider);
                                _resetAnimation();
                                _startAnimation(currentLevel);
                              },
                              child: Rive(
                        artboard: _artboard!,
                        fit: BoxFit.cover,
                      ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                  Positioned(
                    top: 700,
                    left: 171,
                    child: const Text(
                      'Tap to refresh',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'WorkSans',
                        fontSize: 14,
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
