import 'package:flutter/material.dart';

// TODO top, left, bottom
class DashPaint extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final Radius radius;
  final double dashWidth;
  final double dashSpace;

  DashPaint({
    this.strokeWidth = 2,
    this.color = Colors.black,
    this.radius = const Radius.circular(0),
    this.dashWidth = 5,
    this.dashSpace = 2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startY = 0;

    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    Path path = Path()..moveTo(size.width, 0);
    while (startY < size.height) {
      if (startY + dashWidth > size.height) {
        path.lineTo(size.width, size.height);
        break;
      }
      path.lineTo(size.width, startY + dashWidth);
      path.moveTo(size.width, startY + dashWidth + dashSpace);
      startY += dashWidth + dashSpace;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
