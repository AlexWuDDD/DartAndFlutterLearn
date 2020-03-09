
import 'package:flutter/material.dart';

import 'CircleTriangle.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  double _x = 0.0;
  double _y = 0.0;
  double _len = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Circlr Triangle page"),
      ),
      body: Container(
        child: Center(
          child: GestureDetector(
            onHorizontalDragStart: (detail){
              _x = detail.globalPosition.dx;
            },
            onVerticalDragStart: (datail){
              _y = datail.globalPosition.dy;
            },
            onHorizontalDragUpdate: (detail){
              setState(() {
                _len -= detail.globalPosition.dx - _x;
                _x = detail.globalPosition.dx;
              });
            },
            onVerticalDragUpdate: (detail){
              setState(() {
                _len += detail.globalPosition.dy - _y;
                _y = detail.globalPosition.dy;
              });
            },
            child:  Container(
              height: 300,
              width: 300,
              child: CustomPaint(
                painter: CircleTriangle(scrollLen: _len),
              ),
            ),
          ),
        ),
      ),
    );
  }
}