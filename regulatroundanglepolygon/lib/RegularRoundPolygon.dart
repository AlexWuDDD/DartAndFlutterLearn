import 'dart:math';
import 'package:flutter/material.dart';
import 'package:regulatroundanglepolygon/MyCircle.dart';
import 'package:regulatroundanglepolygon/RoundPolygon.dart';
import 'package:regulatroundanglepolygon/Sizeutil.dart';

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


class RegularRoundPolygon extends CustomPainter{

  var myPaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = BLUE_NORMAL
    ..strokeWidth = 6
    ..isAntiAlias = true;

  void _drawWithPoint(Canvas canvas, Paint paint, List list, {hasShadow = false}){
    list = _resizePoint(list);
    var path = RoundPolygon.drawRoundPolygon(list, canvas: canvas, paint: paint, distance: 2.0);
    if(hasShadow){
      canvas.drawShadow(path, Colors.black26, 10.0, true);
    }
    canvas.drawPath(path, paint);
  }  

  List<Point> _resizePoint(List<Point> list){
    List<Point> l = List<Point>();
    for(var p in list){
      l.add(Point(SizeUtil.getAxisX(p.x), SizeUtil.getAxisY(p.y)));
    }
    return l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    SizeUtil.size = size;

    var center = Point(250.0, 250.0);
    var colors = [
      RED_DARK1,
      RED_DARK2,
      YELLOW_NORMAL,
      BLUE_DARK1,
      RED_DARK3,
      BLUE_NORMAL
    ];

    for(int i = 0; i < 100; ++i){
      double radius = 250.0 - i * 30;
      var index = i%colors.length;
      myPaint.color = colors[index];
      if(radius < 10){
        radius = 10;
        List<Point> list4 = MyCircle.convertToPoints(center, radius, 4);
        _drawWithPoint(canvas, myPaint, list4);
      }
      List<Point> list4 = MyCircle.convertToPoints(center, radius, 4, startRadian: i* pi* 0);
      _drawWithPoint(canvas, myPaint, list4);
    }


    canvas.save();
    canvas.restore();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
  
}