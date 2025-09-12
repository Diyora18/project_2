import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    for (int i = 0; i < 4; i++) {
      final path = Path();
      path.moveTo(0, size.height * 0.2 + i * 30);
      path.quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.1 + i * 30,
        size.width,
        size.height * 0.3 + i * 30,
      );
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
