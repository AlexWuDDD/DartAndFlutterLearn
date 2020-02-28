import 'dart:ui';

import 'package:flutter/material.dart';

class CanvasDemo1 extends StatefulWidget {
  CanvasDemo1({Key key}) : super(key: key);

  @override
  _CanvasDemo1State createState() => _CanvasDemo1State();
}

class _CanvasDemo1State extends State<CanvasDemo1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Canvas Demo1"),
      ),
      body: Container( 
        alignment: Alignment.center,
        child: CustomPaint(
          painter: OpenPainter(),
        ),
      )
    );
  }
}

class OpenPainter extends CustomPainter{

  Paint myPaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.red
    ..isAntiAlias = true
    ..strokeWidth = 2
    ..strokeCap = StrokeCap.round;
    

  @override
  void paint(Canvas canvas, Size size) {
    //canvas.drawLine(Offset(10, 10), Offset(100, 100), myPaint);

    // canvas.drawPoints(
    //   PointMode.polygon,
    //   [Offset(200, 200), Offset(250, 250), Offset(100, 100), Offset(50, 180)],
    //   myPaint
    // );

    // Path path = Path();
    // path.moveTo(100, 100);
    // path.lineTo(200, 100);
    // path.lineTo(250, 200);
    // path.lineTo(200, 250);
    // path.quadraticBezierTo(100, 300, 50, 400);
    // path.close();
    // canvas.drawPath(path, myPaint);

    // Rect rect1 = Rect.fromCircle(center: Offset(180, 300), radius: 100);
    // Rect rect2 = Rect.fromCircle(center: Offset(180, 300), radius: 80);
    // canvas.drawRect(rect1, myPaint);
    // canvas.drawRect(rect2, myPaint);

    // canvas.saveLayer(Rect.fromCircle(
    // center: Offset(100 / 2, 100 / 2), radius: 100), myPaint);
    // // 用颜色填充整个绘制区域
    // canvas.drawPaint(Paint()..color = Colors.blue);
    // // 在绘制区域以外绘制一个矩形
    // canvas.drawRect(Rect.fromLTWH(0, 0, 100, 100), Paint()..color = Colors.red);
    // canvas.restore();

    canvas.drawCircle(Offset(10, 10), 10, myPaint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}