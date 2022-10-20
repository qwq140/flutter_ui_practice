import 'package:flutter/material.dart';

class BarPaint extends CustomPainter{

  final double height;
  final Color color;
  final double value;
  final double percent;

  BarPaint({required this.height, required this.color, required this.value, required this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = height
      ..style = PaintingStyle.fill;

    Rect rect = Rect.fromLTRB(0, size.height, size.width*value, 0);

    canvas.drawRect(rect, paint);

    drawText(canvas, percent.toString(), size.width*value, size.height);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawText(Canvas canvas, String text, double endX, double endY){
    TextSpan sp = TextSpan(text: text, style: const TextStyle(color: Colors.white));
    TextPainter tp = TextPainter(text: sp, textDirection: TextDirection.ltr);

    tp.layout(); // 텍스트 페인터에 그려질 텍스트의 크기와 방향을 정한다.
    double dx = 0;
    double dy = endY / 2 - tp.height/2;
    if(endX > tp.width) {
      dx = endX - tp.width - 5;
    }

    tp.paint(canvas, Offset(dx, dy));
  }

}