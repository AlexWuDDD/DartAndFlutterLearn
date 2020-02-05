import 'dart:ui';

import 'package:flutter/material.dart';

class Bar{
  Bar(this.height);
  final double height;

  static Bar lerp(Bar begin, Bar end, double t){
    return Bar(lerpDouble(begin.height, end.height, t));
  }
}

class BarTween extends Tween<Bar>{
  BarTween(Bar begin, Bar end): super(begin: begin, end: end);

  @override
  Bar lerp(double t) => Bar.lerp(begin, end, t);
}

class BarChartPainter extends CustomPainter{

  static const barWidth = 10.0;

  final Animation<Bar> animation;
  BarChartPainter(Animation<Bar>animation)
    :animation = animation,
    super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final bar = animation.value;
    final paint = Paint()
      ..color = Colors.blue[300]
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromLTWH(
        (size.width - barWidth) / 2.0, 
        size.height - bar.height, 
        barWidth, 
        bar.height,
      ), 
      paint,
    );  
  }

  @override
  bool shouldRepaint(BarChartPainter old) {
    // TODO: implement shouldRepaint
    return false;
  }
  
}