import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/screen/model/nutrient_model.dart';

class PieChartPaint extends CustomPainter{

  final List<NutrientModel> list;
  double startDeg;
  final double? acValue;

  PieChartPaint({required this.list, this.startDeg = 0, this.acValue,});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.fill;   // 2.

    for(int i = 0 ; i < list.length ; i++){
      startDeg = i == 0 ? startDeg : startDeg + perToDeg(list[i-1].percent);
      draw(perToDeg(list[i].percent), list[i].color, paint, canvas, size, startDeg, list[i].name);
    }

    // draw(30, Colors.blue, paint, canvas, size, 30);
    // draw(160, Colors.red, paint, canvas, size, 240);
    
  }

  double perToDeg(double per) => 360 * (per / 100);

  double degToRad(double deg) => deg * (pi / 180.0);

  // arcTo를 이용해서 호를 그린다.
  // 중앙 좌표로 이동 후 호 그릴때의 시작 좌표로 이동한다.
  void draw(double deg, Color color, Paint paint, Canvas canvas, Size size, double startDeg, String text){

    // 센터 좌표
    Offset center = Offset(size.width/2, size.height/2);
    // 반지름
    double radius = size.width/2;

    paint.color = color;

    final path = Path();

    // 호
    path.arcTo(
        Rect.fromCenter(
          center: center,
          height: size.height,
          width: size.width,
        ),   // 5.
        degToRad(startDeg),   // 6.
        degToRad(deg), // 7.
        false);

    // 호 그린 후 중앙으로 이동
    path.lineTo(center.dx, center.dy);
    // 호 시작지점으로 이동
    path.lineTo(center.dx + (radius*cos(degToRad(startDeg))), center.dy + radius * sin(degToRad(startDeg)));

    canvas.drawPath(path, paint);   // 8.

    // 텍스트 적기
    // TextSpan sp = TextSpan(text : text, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black));
    // TextPainter tp = TextPainter(text: sp, textDirection: TextDirection.ltr);
    // tp.layout();
    // double dx = (radius/2) * cos(degToRad(90 - (deg - startDeg))) + center.dx;
    // double dy = (radius/2) * sin(degToRad(90 - (deg - startDeg))) + center.dy;
    //
    // Offset offset = Offset(dx, dy);
    // tp.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}