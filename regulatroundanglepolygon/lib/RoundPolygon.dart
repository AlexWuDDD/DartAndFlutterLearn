
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:regulatroundanglepolygon/LineInterCircle.dart';

class RoundPolygon{
  static Path drawRoundPolygon(List<Point> ps, {double distance, Canvas canvas, Paint paint}){
    var path = Path();
    ps.add(ps[0]);
    ps.add(ps[1]);

    var p0 = LineInterCircle.intersectionPoint(ps[1], ps[0], distance);

    path.moveTo(p0.x, p0.y);

    for(int i = 0; i< ps.length-2; ++i){
      var p1 = ps[i];
      var p2 = ps[i+1];
      var p3 = ps[i+2];
      var interP1 = LineInterCircle.intersectionPoint(p1, p2, distance);
      var interP2 = LineInterCircle.intersectionPoint(p3, p2, distance);
      path.lineTo(interP1.x, interP1.y);
      path.arcToPoint(Offset(interP2.x, interP2.y), radius: Radius.circular(distance*6));
    }
    return path;
  }
}