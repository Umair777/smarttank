import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'dart:async';

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
    setState(() {
      _isFilling = !_isFilling;
      if (_isFilling) {
        // Reset the animation to its initial state
        _fillingAnimation?.reset();

        // Restart the animation timer
        _startAnimationTimer();
      } else {
        // Cancel the animation timer
        _animationTimer?.cancel();
      }
      _fillingAnimation?.isActive = _isFilling;
    });
  }

  void _startAnimationTimer() {
    // Cancel the previous timer if it's running
    _animationTimer?.cancel();

    // Start a new timer for 1 second
    _animationTimer = Timer(Duration(seconds: 2), () {
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
