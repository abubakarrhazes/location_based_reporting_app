import 'package:flutter/material.dart';

class AvatarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final center = Offset(size.width / 2, size.height / 2);

    paint.color = Colors.black;
    canvas.drawCircle(Offset(center.dx - 10, center.dy - 6), 2.5, paint);
    canvas.drawCircle(Offset(center.dx + 10, center.dy - 6), 2.5, paint);

    paint.color = Color(0xFF9E9E9E);
    final path = Path();
    path.moveTo(center.dx - 8, center.dy + 8);
    path.quadraticBezierTo(
      center.dx,
      center.dy + 12,
      center.dx + 8,
      center.dy + 8,
    );
    path.quadraticBezierTo(
      center.dx + 6,
      center.dy + 15,
      center.dx - 6,
      center.dy + 15,
    );
    path.quadraticBezierTo(
      center.dx - 8,
      center.dy + 12,
      center.dx - 8,
      center.dy + 8,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
