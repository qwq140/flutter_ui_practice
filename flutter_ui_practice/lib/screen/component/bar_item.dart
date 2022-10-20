import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/screen/component/bar_paint.dart';

class BarItem extends StatefulWidget {
  final String label;
  final double percent;
  final Color color;
  final double height;

  const BarItem(
      {Key? key, required this.percent, required this.color, this.height = 20, required this.label})
      : super(key: key);

  @override
  State<BarItem> createState() => _BarItemState();
}

class _BarItemState extends State<BarItem> with SingleTickerProviderStateMixin{

  late AnimationController ac;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    ac = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000), upperBound: widget.percent / 100);
    ac.forward();
    ac.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    ac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        Row(
          children: [
            Expanded(
              child: Container(
                height: widget.height,
                color: Colors.grey[300],
                child: CustomPaint(
                  painter: BarPaint(height: widget.height, percent : widget.percent, color: widget.color, value: ac.value),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const Text('100%'),
          ],
        ),
      ],
    );
  }
}
