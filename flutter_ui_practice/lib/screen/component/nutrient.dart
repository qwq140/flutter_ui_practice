import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/screen/component/bar_item.dart';

class Nutrient extends StatelessWidget {
  const Nutrient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text('다량영양소', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
        SizedBox(height: 16,),
        BarItem(percent: 24, color: Colors.blueAccent, label: '탄수화물',),
        SizedBox(height: 8),
        BarItem(percent: 65, color: Colors.blue, label: '단백질',),
        SizedBox(height: 8),
        BarItem(percent: 51, color: Colors.lightBlue, label: '지방',),
        SizedBox(height: 8),
        BarItem(percent: 24, color: Colors.cyan, label: '총 식이섬유',),
        SizedBox(height: 8),
        BarItem(percent: 48, color: Colors.greenAccent, label: '콜레스테롤',),
        SizedBox(height: 8),
        BarItem(percent: 48, color: Colors.tealAccent, label: '총 포화 지방산',),
      ],
    );
  }
}