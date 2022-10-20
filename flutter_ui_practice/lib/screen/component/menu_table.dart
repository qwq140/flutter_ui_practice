import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/screen/component/dash_paint.dart';

class MenuTable extends StatelessWidget {
  const MenuTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const baseBorder = BorderSide(color: Colors.grey, width: 1);
    return Stack(
      children: [
        /// TODO dash line 구현하기
        Positioned.fill(
          child: CustomPaint(
            painter: DashPaint(color: Colors.grey, strokeWidth: 1),
          ),
        ),
        Table(
          border: const TableBorder(
            top: baseBorder,
            bottom: baseBorder,
            verticalInside: baseBorder,
            horizontalInside: baseBorder,
          ),
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
          },
          children: [
            TableRow(
              children: [
                _LeftColumn(name: '조식', kcal: 828),
                _RightColumn(
                  name: '율무밥',
                  type: '밥류',
                  ingredient: '흰쌀',
                  amount: 210,
                  kcal: 130,
                ),
              ],
            ),
            TableRow(
              children: [
                _LeftColumn(name: '중식', kcal: 828),
                _RightColumn(
                  name: '율무밥',
                  type: '밥류',
                  ingredient: '흰쌀',
                  amount: 210,
                  kcal: 130,
                ),
              ],
            ),
            TableRow(
              children: [
                _LeftColumn(name: '석식', kcal: 828),
                _RightColumn(
                  name: '율무밥',
                  type: '밥류',
                  ingredient: '흰쌀',
                  amount: 210,
                  kcal: 130,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _LeftColumn extends StatelessWidget {
  final String name;
  final int kcal;

  const _LeftColumn({Key? key, required this.name, required this.kcal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          Text.rich(
            TextSpan(
              text: kcal.toString(),
              style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: ' kcal',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RightColumn extends StatefulWidget {
  final String name;
  final String type;
  final String ingredient;
  final int amount;
  final int kcal;

  const _RightColumn(
      {Key? key,
      required this.name,
      required this.type,
      required this.ingredient,
      required this.amount,
      required this.kcal})
      : super(key: key);

  @override
  State<_RightColumn> createState() => _RightColumnState();
}

class _RightColumnState extends State<_RightColumn> {
  bool isLike = false;
  bool isClick = false;

  Widget labelRow(
      {required String name, required Icon icon, VoidCallback? onclick}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: onclick,
          child: icon,
        ),
      ],
    );
  }

  Widget row({required String left, required String right}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left,
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
        Text(
          right,
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHighlightChanged: (value) {
        setState(() {
          isClick = value;
        });
      },
      highlightColor: const Color(0xFFF2FCF9),
      child: Container(
        decoration: BoxDecoration(
          border: isClick
              ? Border(
                  top: BorderSide(color: Colors.blue),
                  left: BorderSide(color: Colors.blue),
                  bottom: BorderSide(color: Colors.blue),
                )
              : null,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              labelRow(
                name: widget.name,
                icon: Icon(
                    isLike ? Icons.favorite : Icons.favorite_border_outlined,
                    color: Colors.red,
                    size: 20),
                onclick: () {
                  setState(() {
                    isLike = !isLike;
                  });
                },
              ),
              SizedBox(height: 8),
              row(left: '종류', right: widget.type),
              row(left: '재료', right: widget.ingredient),
              row(left: '정량', right: '${widget.amount}g'),
              row(left: '칼로리', right: '${widget.kcal}kcal'),
            ],
          ),
        ),
      ),
    );
  }
}
