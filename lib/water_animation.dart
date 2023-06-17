import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'dart:async';

import 'package:smarttank/tank_level.dart';

int mapTankLevelToDuration(int tankLevel) {
  const int maxTankLevel = 100;
  const int maxDuration = 3000;

  return ((tankLevel / maxTankLevel) * maxDuration).toInt();
}

class WaterUpdater extends StatefulWidget {
  const WaterUpdater({Key? key}) : super(key: key);

  @override
  _WaterUpdaterState createState() => _WaterUpdaterState();
}

class _WaterUpdaterState extends State<WaterUpdater> {
  Artboard? _artboard;
  SimpleAnimation? _fillingAnimation;
  bool _isFilling = true;

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

    // Start the animation timer
    _startAnimationTimer();
  }

  void _toggleAnimation() {
    _isFilling = false;

    setState(() {
      _fillingAnimation?.reset();
      _animationTimer?.cancel();
      _isFilling = !_isFilling;
      if (_isFilling) {
        // Reset the animation to its initial state
        _fillingAnimation?.reset();
        _animationTimer?.cancel();

        // Restart the animation timer
        _startAnimationTimer();
      } else {
        _animationTimer?.cancel();
        // Cancel the animation timer
      }
      _fillingAnimation?.isActive = _isFilling;
    });
  }

  void _startAnimationTimer() {
    // Cancel the previous timer if it's running
    _animationTimer?.cancel();

    // Start a new timer for 1 second
    // double tank_animation_duration = mapTankLevelToDuration(1500);
    // print('Tank : $tank_animation_duration');
    final container = ProviderContainer();
    final tankLevel = container.read(tankLevelProvider);
    int tank_animation_duration = mapTankLevelToDuration(tankLevel);
    int t = tank_animation_duration.toInt();
    print('T: $t');
    _animationTimer = Timer(Duration(milliseconds: t), () {
      setState(() {
        _isFilling = false;
        _fillingAnimation?.isActive = _isFilling;
      });
    });
  }

  @override
  void dispose() {
    _animationTimer?.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: InkWell(
            onTap: _toggleAnimation,
            child: Stack(
              children: [
                Positioned(
                  top: 444,
                  left: 58,
                  child: Container(
                    width: 530,
                    height: 330,
                    child: _artboard != null
                        ? RiveAnimation.asset(
                            'assets/animations/smarttank.riv',
                            artboard: _artboard!.name,
                            fit: BoxFit.cover,
                            controllers: [_fillingAnimation!],
                          )
                        : const SizedBox(),
                  ),
                ),
                const Positioned(
                    top: 703,
                    left: 171,
                    child: Text(
                      'Tap to refresh',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'WorkSans',
                          fontSize: 12,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
