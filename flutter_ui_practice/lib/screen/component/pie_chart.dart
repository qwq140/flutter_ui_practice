import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/screen/component/pie_chart_paint.dart';
import 'package:flutter_ui_practice/screen/model/nutrient_model.dart';

class PieChart extends StatefulWidget {
  final List<NutrientModel> list;
  final double radius;
  final double startDeg;

  const PieChart({Key? key, required this.list, required this.radius, this.startDeg = 0}) : super(key: key);

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> with SingleTickerProviderStateMixin{


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PieChartPaint(
        list: widget.list,
        startDeg: widget.startDeg,
      ),
      child: SizedBox(
        width: widget.radius * 2,
        height: widget.radius * 2,
      ),
    );
  }
}
