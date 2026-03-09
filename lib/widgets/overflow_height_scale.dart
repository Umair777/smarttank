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
  @override
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 140,   // increased width so it doesn't crop
      height: 280,

      child: Stack(
        children: [

          /// HEADING
          const Positioned(
            top: 40,
            left: 0,
            child: Text(
              "Overflow\nHeight",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                height: 1.2,
              ),
            ),
          ),

          /// SCALE BRACKET
          Positioned(
            left: 0,
            top: 105,
            child: SizedBox(
              width: 20,
              height: 165,
              child: CustomPaint(
                painter: OverflowScalePainter(),
              ),
            ),
          ),

          /// INPUT NUMBER
          Positioned(
            left: 24,
            top: 160,
            child: SizedBox(
              width: 70,
              child: TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                ),
                onChanged: (value) {
                  double? h = double.tryParse(value);
                  if (h != null) {
                    onChanged(h);
                  }
                },
              ),
            ),
          ),

          /// UNIT TEXT
          const Positioned(
            left: 32,
            top: 210,
            child: Text(
              "Inches",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
          ),

        ],
      ),
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