import 'package:flutter/material.dart';

class OverflowHeightScale extends StatelessWidget {

  final TextEditingController heightController;
  final double heightValue;
  final Function(double) onChanged;

  const OverflowHeightScale({
    super.key,
    required this.heightController,
    required this.heightValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        const Text(

          "Overflow Height",
          style: TextStyle(color: Colors.white70, fontSize: 18),
        ),

        const SizedBox(height: 6),

        SizedBox(
          width: 70,
          child: TextField(
            controller: heightController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              isDense: true,
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              double? h = double.tryParse(value);
              if (h != null) {
                onChanged(h);
              }
            },
          ),
        ),

        const SizedBox(height: 10),

        /// SCALE BRACKET
        Positioned(
          right: 0,
          top: -3,
          child: SizedBox(
            height: 180,
            child: CustomPaint(
              size: const Size(20, 180),
              painter: OverflowScalePainter(),
            ),
          ),
        ),
      ],
    );
  }
}

class OverflowScalePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..color = Colors.white70
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double x = size.width - 2; // vertical line position

    /// vertical line
    canvas.drawLine(
      Offset(x, 0),
      Offset(x, size.height),
      paint,
    );

    /// top bracket (pointing left)
    canvas.drawLine(
      Offset(x, 0),
      Offset(0, 0),
      paint,
    );

    /// bottom bracket (pointing left)
    canvas.drawLine(
      Offset(x, size.height),
      Offset(0, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}