import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class WaterUpdater extends StatefulWidget {
  @override
  _WaterUpdaterState createState() => _WaterUpdaterState();
}

class _WaterUpdaterState extends State<WaterUpdater> {
  Artboard? _artboard;
  SimpleAnimation? _fillingAnimation;
  SimpleAnimation? _drainingAnimation;

  bool _isFilling = true;

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
      _drainingAnimation = SimpleAnimation('Draining');
      _artboard!.addController(_fillingAnimation!);
      _artboard!.addController(_drainingAnimation!);
    });
  }

  void _toggleAnimation() {
    setState(() {
      _isFilling = !_isFilling;
      if (_isFilling) {
        _fillingAnimation?.isActive = true;
        _drainingAnimation?.isActive = false;
      } else {
        _fillingAnimation?.isActive = false;
        _drainingAnimation?.isActive = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: GestureDetector(
            onTap: _toggleAnimation,
            child: Stack(
              children: [
                Positioned(
                  top: 440,
                  left: 55,
                  child: Container(
                    width: 530, // Set your desired width here
                    height: 330, // Set your desired height here
                    child: _artboard != null
                        ? RiveAnimation.asset(
                            'assets/animations/smarttank.riv',
                            artboard: _artboard!.name,
                            fit: BoxFit.cover,
                            controllers: _isFilling
                                ? [_fillingAnimation!]
                                : [_drainingAnimation!],
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
