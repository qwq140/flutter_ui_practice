import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/screen/component/menu_table.dart';
import 'package:flutter_ui_practice/screen/component/nutrient.dart';
import 'package:flutter_ui_practice/screen/component/pie_chart.dart';
import 'package:flutter_ui_practice/screen/model/nutrient_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<NutrientModel> list = [
      NutrientModel(name: '탄수화물', percent: 28.30, color: Colors.orangeAccent),
      NutrientModel(name: '단백질', percent: 35.85, color: Colors.purple),
      NutrientModel(name: '지방', percent: 35.85, color: Colors.teal),
    ];

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            const MenuTable(),
            const SizedBox(height: 24),
            const Nutrient(),
            const SizedBox(height: 40),
            Align(alignment : Alignment.center, child: PieChart(list: list, radius: 100, startDeg: 0),),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
