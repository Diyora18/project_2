import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    for (int i = 0; i < 4; i++) {
      final path = Path();
      path.moveTo(0, size.height * 0.3 + i * 20);
      path.quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.25 + i * 20,
        size.width,
        size.height * 0.4 + i * 20,
      );
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}