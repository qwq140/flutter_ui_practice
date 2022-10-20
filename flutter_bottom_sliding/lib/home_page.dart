import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int tab = 0;
  double _scrollOpacity = 0;
  final double _minDragSize = 0.1;
  final double _maxDragSize = 0.9;
  double _dragScrollExtent = 0.1;

  @override
  Widget build(BuildContext context) {
    final onBorder = Border(bottom: BorderSide(color: Colors.white.withOpacity(_scrollOpacity)));
    return Scaffold(
      backgroundColor: const Color(0xFF382521),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).padding.top,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1 - MediaQuery.of(context).padding.top,
              width: MediaQuery.of(context).size.width,
              child: Opacity(
                opacity: _dragScrollExtent > 0.7 ? (_dragScrollExtent >= _maxDragSize ? 1 : (_dragScrollExtent - 0.7) * 5) : 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: (MediaQuery.of(context).size.width) * (0.2) + 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('테스트', style: TextStyle(color: Colors.white),),
                        Text('테스트', style: TextStyle(fontSize: 12, color: Colors.white),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 100 * (_maxDragSize - _dragScrollExtent) + MediaQuery.of(context).padding.top + (MediaQuery.of(context).size.height * 0.1 - MediaQuery.of(context).padding.top - (MediaQuery.of(context).size.width - 48) * (1 - (_maxDragSize - 0.1) * (1/_maxDragSize))) / 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Image.network(
                'https://picsum.photos/400/250',
                fit: BoxFit.cover,
                width: (MediaQuery.of(context).size.width - 48) * (1-(_dragScrollExtent - 0.1) * (10/9)),
                height: (MediaQuery.of(context).size.width - 48) * (1-(_dragScrollExtent - 0.1) * (10/9)),
              ),
            ),
          ),
          NotificationListener<DraggableScrollableNotification>(
            onNotification: (notification) {
              setState(() {
                // notification.extent : 0.1 ~ 0.9
                _dragScrollExtent = notification.extent;
                if((_dragScrollExtent - 0.1) * (1/(_maxDragSize-0.1)) > 1) {
                  _scrollOpacity = 1;
                } else {
                  _scrollOpacity = (_dragScrollExtent - 0.1) * (1/(_maxDragSize-0.1));
                }
              });
              return true;
            },
            child: DraggableScrollableSheet(
              snap: true,
              initialChildSize: _minDragSize,
              minChildSize: _minDragSize,
              maxChildSize: _maxDragSize,
              builder: (context, scrollController) {
                return ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                  child: Container(
                    color: Colors.brown,
                    child: ListView(
                      controller: scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 5,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(_scrollOpacity))),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      tab = 0;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      border: tab == 0 ? onBorder : null,
                                    ),
                                    child: Text(
                                      '테스트1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      tab = 1;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      border: tab == 1 ? onBorder : null,
                                    ),
                                    child: Text(
                                      '테스트2',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      tab = 2;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      border: tab == 2 ? onBorder : null,
                                    ),
                                    child: Text(
                                      '테스트3',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
