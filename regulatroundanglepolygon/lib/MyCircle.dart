
import 'dart:math';

class MyCircle {
  //give the center, radius of the circle
  //and have radian from x clockwise direction,
  //you can get the point coordiante in the circle
  static Point _radianPoint(Point center, double r, double radian){
    return Point(center.x + r*cos(radian), center.y + r * sin(radian));
  }

  static List<Point> convertToPoints(Point center, double r, int num, {double startRadian = 0.0}){
    var list = List<Point>();
    double perRadian = 2.0 * pi / num;
    for(int i = 0; i < num; ++i){
      double radian = i * perRadian + startRadian;
      if(radian > 2 * pi){
        radian -= 2 * pi;
      }
      print(radian);
      var p = _radianPoint(center, r, radian);
      list.add(p);
    }
    print(list.length);
    return list;
  }
}

