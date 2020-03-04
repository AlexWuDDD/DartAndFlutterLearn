import 'dart:math';

import 'package:flutter/material.dart';
import 'package:piechart/MyCircle.dart';
const BLUE_NORMAL = Color(0xff54c5f8);
const GREEN_NORMAL = Color(0xff6bde54);
const BLUE_DARK2 = Color(0xff01579b);
const BLUE_DARK1 = Color(0xff29b6f6);
const RED_DARK1 = Color(0xfff26388);
const RED_DARK2 = Color(0xfff782a0);
const RED_DARK3 = Color(0xfffb8ba8);
const RED_DARK4 = Color(0xfffb89a6);
const RED_DARK5 = Color(0xfffd86a5);
const YELLOW_NORMAL = Color(0xfffcce89);

class PiechartPainter extends CustomPainter{

  Paint myPaint = Paint()
  ..color = BLUE_NORMAL
  ..isAntiAlias = true
  ..strokeWidth = 10.0
  ..style = PaintingStyle.stroke;

  List<double> sources = [1,2,2,2,2,1,2];
  List<Color> colors = [BLUE_DARK1, RED_DARK1, BLUE_DARK2, GREEN_NORMAL, YELLOW_NORMAL];

  void _drawArcGroup(Canvas canvas, Paint paint,
   {
     Offset center,
     double radius,
     List<double> sources,
     List<Color> colors,
     double startAngle = 0.0,
     double paintWidth = 10.0,
     bool hasEnd = false,
     bool hasCurrent = false,
     int curIndex = 0,
     curPaintWidth = 12.0
   }){
      assert(sources != null && sources.length > 0);
      assert(colors != null && colors.length > 0);
      double total = 0;
      for(double d in sources){
        total += d;
      }
      assert(total > 0.0);
      List<double> radians = List<double>();
      for(double d in sources){
        double radian = d * 2 * pi / total;
        radians.add(radian);
      }
      var startA = startAngle;
      paint.style = PaintingStyle.stroke;
      var curStartAngle = 0.0;
      for(int i = 0; i < radians.length; ++i){
        var rd = radians[i];
        if(hasCurrent && curIndex == i){
          curStartAngle = startA;
          startA += rd;
          continue;
        }
        paint.color = colors[i%colors.length];
        paint.strokeWidth = paintWidth;
        _drawArcWithCenter(canvas, paint, center, radius, startRadian: startA, sweepRadian: rd);
        startA += rd;
      }
      if (hasEnd) {
        startA = startAngle;
        paint.strokeWidth = paintWidth;
        for (int i = 0; i < radians.length; i++) {
          var rd = radians[i];
          if (hasCurrent && curIndex == i) {
          startA += rd;
          continue;
          }
          paint.color = colors[i % colors.length];
          paint.strokeWidth = paintWidth;
          _drawAcrTwoPoint(canvas, paint,
          center: center,
          radius: radius,
          startRadian: startA,
          sweepRadian: rd,
          hasEndArc: true);
          startA += rd;
        }
      }

      if (hasCurrent) {
        paint.color = colors[curIndex % colors.length];
        paint.strokeWidth = curPaintWidth;
        paint.style = PaintingStyle.stroke;
        _drawArcWithCenter(canvas, paint,
            center,
            radius,
            startRadian: curStartAngle,
            sweepRadian: radians[curIndex]);
      }
      if (hasCurrent && hasEnd) {
        var rd = radians[curIndex % radians.length];
        paint.color = colors[curIndex % colors.length];
        paint.strokeWidth = curPaintWidth;
        paint.style = PaintingStyle.fill;
        _drawAcrTwoPoint(canvas, paint,
            center: center,
            radius: radius,
            startRadian: curStartAngle,
            sweepRadian: rd,
            hasEndArc: true,
            hasStartArc: false);
      }
   }
  


  void _drawArcWithCenter(Canvas canvas, Paint paint, Offset center, double radius, {double startRadian = 0.0, double sweepRadian = pi}){
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startRadian, sweepRadian, false, paint);
  }

  void _drawAcrTwoPoint(Canvas canvas, Paint paint, {Offset center, double radius, startRadian = 0.0, sweepRadian = pi,
                        hasStartArc = false, hasEndArc = false}){
                          var smallR = paint.strokeWidth / 2;
                          paint.strokeWidth = smallR;
                          if(hasStartArc){
                            var startCenter = MyCircle.radianPoint(Point(center.dx, center.dy), radius, startRadian);
                            paint.style = PaintingStyle.fill;
                            canvas.drawCircle(Offset(startCenter.x, startCenter.y),smallR, paint);
                          }
                          if(hasEndArc){
                            var startCenter = MyCircle.radianPoint(Point(center.dx, center.dy), radius, startRadian + sweepRadian);
                            paint.style = PaintingStyle.fill;
                            canvas.drawCircle(Offset(startCenter.x, startCenter.y),smallR, paint);
                          }
                        }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    //_drawArcWithCenter(canvas, myPaint, Offset(150, 150), 100, sweepRadian: pi*1.5);
    //_drawAcrTwoPoint(canvas, myPaint, center: Offset(150, 150), radius: 100, hasStartArc: true, hasEndArc: true, sweepRadian: pi*1.5);
    _drawArcGroup(canvas, myPaint, center: Offset(150, 150), radius: 100, sources: sources, colors: colors,
      paintWidth: 50.0, startAngle: 0.0, hasEnd: false, hasCurrent: true, curPaintWidth: 60.0, curIndex: 0);
    canvas.save();
    canvas.restore();  
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
  
}