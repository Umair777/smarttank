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

  void _startAnimation() {
    _fillingAnimation?.isActive = true;
    _animationTimer?.cancel();
    _animationTimer = Timer(Duration(seconds: 2), () {
      setState(() {
        _fillingAnimation?.isActive = false;
      });
    });
  }

  @override
  void dispose() {
    _animationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Stack(
            children: [
              Positioned(
                top: 444,
                left: 58,
                child: Container(
                  width: 530,
                  height: 330,
                  child: _artboard != null
                      ? GestureDetector(
                          onTap: () {
                            _resetAnimation();
                            _startAnimation();
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
            ],
          ),
        ),
      ],
    );
  }
}
