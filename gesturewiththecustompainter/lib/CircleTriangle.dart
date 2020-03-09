

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gesturewiththecustompainter/ColorDefine.dart';
import 'package:gesturewiththecustompainter/SizeUtil.dart';

class CircleTriangle extends CustomPainter{

  final double scrollLen;

  CircleTriangle({this.scrollLen});

  void _drawTriCircle(Canvas canvas, Paint paint, {
    Offset center,
    double radius,
    List<double> sources,
    List<Color> colors,
    double startRadian
  }){
    assert(sources != null && sources.length > 0);
    assert(colors != null && colors.length > 0);
    var total = 0.0;
    for(var d in sources){
      total += d;
    }
    List<double> radians = [];
    for(var data in sources){
      radians.add(data*2*pi/total);
    }
    for(int i = 0; i < radians.length; ++i){
      paint.color = colors[i%colors.length];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startRadian, radians[i], true, paint);
      startRadian += radians[i];
    }
    
  }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    SizeUtil.size = size;
    var paint = Paint()
    ..style = PaintingStyle.fill
    ..color = BLUE_NORMAL
    ..strokeWidth = 2.0
    ..isAntiAlias = true;

    paint.color = RED_DARK1;
    paint.strokeWidth = 20;
    //paint.style = PaintingStyle.stroke;
    var center = Offset(SizeUtil.getAxisX(250.0), SizeUtil.getAxisY(250));
    var radius = SizeUtil.getAxisBoth(200);
    _drawTriCircle(canvas, paint,
      sources: [1, 2,2,1,1,1,1],
      colors: [RED_DARK1, BLUE_NORMAL, GREEN_NORMAL, RED_DARK5, YELLOW_NORMAL],
      center: center,
      radius: radius,
      startRadian: 1.4 * this.scrollLen / radius,
    );

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CircleTriangle oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate.scrollLen != this.scrollLen;
  }
  
}