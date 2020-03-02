import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:roundanglepolygon/sizeUtil.dart';

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

class Line{
  //y = kx + c
  static double normalLine(x, {k = 0, c = 0}){
    return k * x + c;
  }

  //Calculate the param k in y = kx + c
  static double paramK(Point p1, Point p2){
    if(p1.x == p2.x) return 0;
    return (p2.y - p1.y)/(p2.x - p1.x);
  }

  //Calculate the param C in y = kx + c
  static double paramC(Point p1, Point p2){
    return p1.y - paramK(p1, p2) * p1.x;
  }
}


// start point p1, end point p2, p2 is center of the circle, r is its radius
class LineInterCircle{
  //param a: y = kx+c intersect with circle, which has the center with point2 and radius R
  // when drive to x^2 + ax + b = 0 equation, the param is here.
  static double paramA(Point p1, Point p2) {
    return (2 * Line.paramK(p1, p2) * Line.paramC(p1, p2) -
            2 * Line.paramK(p1, p2) * p2.y -
            2 * p2.x) /
        (Line.paramK(p1, p2) * Line.paramK(p1, p2) + 1);
  }

  /// start point p1, end point p2,p2 is center of the circle,r is its radius.
  /// param b: y = kx +c intersect with circle,which has the center with point2 and radius R .
  /// when derive to x2+ ax +b = 0 equation. the param b is here.
  static double paramB(Point p1, Point p2, double r) {
    return (p2.x * p2.x -
            r * r +
            (Line.paramC(p1, p2) - p2.y) * (Line.paramC(p1, p2) - p2.y)) /
        (Line.paramK(p1, p2) * Line.paramK(p1, p2) + 1);
  }

  ///the circle has the intersection or not
  static bool isIntersection(Point p1, Point p2, double r) {
    var delta = sqrt(paramA(p1, p2) * paramA(p1, p2) - 4 * paramB(p1, p2, r));
    return delta >= 0.0;
  }

  ///the x coordinate whether or not is between two point we give.
  static bool _betweenPoint(x, Point p1, Point p2) {
    if (p1.x > p2.x) {
      return x > p2.x && x < p1.x;
    } else {
      return x > p1.x && x < p2.x;
    }
  }

  static Point _equalX(Point p1, Point p2, double r) {
    if (p1.y > p2.y) {
      return Point(p2.x, p2.y + r);
    } else if (p1.y < p2.y) {
      return Point(p2.x, p2.y - r);
    } else {
      return p2;
    }
  }

  static Point _equalY(Point p1, Point p2, double r) {
    if (p1.x > p2.x) {
      return Point(p2.x + r, p2.y);
    } else if (p1.x < p2.x) {
      return Point(p2.x - r, p2.y);
    } else {
      return p2;
    }
  }

  ///intersection point
  static Point intersectionPoint(Point p1, Point p2, double r) {
    if (p1.x > p2.x - 1 && p1.x < p2.x + 1) return _equalX(p1, p2, r);
    if (p1.y > p2.y - 1 && p1.y < p2.y + 1) return _equalY(p1, p2, r);
    var delta = sqrt(paramA(p1, p2) * paramA(p1, p2) - 4 * paramB(p1, p2, r));
    if (delta < 0.0) {
      //when no intersection, i will return the center of the circ  le.
      return p2;
    }
    var a_2 = -paramA(p1, p2) / 2.0;
    var x1 = a_2 + delta / 2;
    if (_betweenPoint(x1, p1, p2)) {
      var y1 = Line.paramK(p1, p2) * x1 + Line.paramC(p1, p2);
      return Point(x1, y1);
    }
    var x2 = a_2 - delta / 2;
    var y2 = Line.paramK(p1, p2) * x2 + Line.paramC(p1, p2);
    return Point(x2, y2);
  }
}

class MyPainter extends CustomPainter{

  var myPaint = Paint()
    ..style = PaintingStyle.fill
    ..color = BLUE_NORMAL
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true;

  Path _drawRoundPolygon(List<Point> ps, double distance, Canvas canvas, Paint paint){
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

  List<Point> _resizePoint(List<Point> list){
    List<Point> l = List<Point> ();
    for(var p in list){
      l.add(Point(SizeUtil.getAxisX(p.x), SizeUtil.getAxisY(p.y)));
    }
    return l;
  }

  void _drawWithPoint(Canvas canvas, Paint paint, List<Point> list, {bool hasShadow = false}){
    list = _resizePoint(list);
    var path = _drawRoundPolygon(list, 4.0, canvas, paint);
    if(hasShadow){
      canvas.drawShadow(path, Colors.black26, 10.0, true);
    }
    canvas.drawPath(path, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    print(size.width);
    print(size.height);
    SizeUtil.size = size;

        List<Point> list1 = [
      Point(250.0, 0.0),
      Point(425.0, 75.0),
      Point(500.0, 250.0),
      Point(425.0, 425.0),
      Point(250.0, 500.0),
      Point(75.0, 426.0),
      Point(0.0, 250.0),
      Point(75.0, 75.0),
    ];
    myPaint.color = RED_DARK1;
    _drawWithPoint(canvas, myPaint, list1);
    List<Point> list2 = [
      Point(250.0, 53.0),
      Point(392.0, 108.0),
      Point(449.0, 250.0),
      Point(392.0, 390.0),
      Point(250.0, 448.0),
      Point(110.0, 390.0),
      Point(54.0, 250.0),
      Point(110.0, 108.0),
    ];
    myPaint.color = RED_DARK2;
    _drawWithPoint(canvas, myPaint, list2, hasShadow: true);

    List<Point> list3 = [
      Point(250.0, 100.0),
      Point(358.0, 143.0),
      Point(400.0, 250.0),
      Point(355.0, 355.0),
      Point(250.0, 400.0),
      Point(144.0, 357.0),
      Point(100.0, 250.0),
      Point(144.0, 144.0),
    ];
    myPaint.color = RED_DARK3;
    _drawWithPoint(canvas, myPaint, list3, hasShadow: true);

    List<Point> list4 = [
      Point(250.0, 150.0),
      Point(320.0, 180.0),
      Point(348.0, 250.0),
      Point(320.0, 320.0),
      Point(250.0, 348.0),
      Point(180.0, 320.0),
      Point(150.0, 250.0),
      Point(180.0, 180.0),
    ];
    myPaint.color = RED_DARK4;
    _drawWithPoint(canvas, myPaint, list4, hasShadow: true);

    List<Point> list5 = [
      Point(250.0, 202.0),
      Point(286.0, 217.0),
      Point(300.0, 250.0),
      Point(284.0, 284.0),
      Point(250.0, 300.0),
      Point(214.0, 282.0),
      Point(202.0, 250.0),
      Point(216.0, 216.0),
    ];
    myPaint.color = RED_DARK5;
    _drawWithPoint(canvas, myPaint, list5, hasShadow: true);

    List<Point> listYellow = [
      Point(110.0, 104.0),
      Point(250.0, 153.0),
      Point(358.0, 143.0),
      Point(450.0, 252.0),
      Point(369.0, 349.0),
      Point(250.0, 504.0),
      Point(140.0, 353.0),
      Point(100.0, 250.0),
    ];
    myPaint.color = YELLOW_NORMAL.withOpacity(0.5);
    _drawWithPoint(canvas, myPaint, listYellow);
    canvas.save();
    canvas.restore();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
  
}

class roundAnglePolygon extends StatefulWidget {
  roundAnglePolygon({Key key}) : super(key: key);

  @override
  _roundAnglePolygonState createState() => _roundAnglePolygonState();
}

class _roundAnglePolygonState extends State<roundAnglePolygon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("round angle polygon"),
      ),
      body: Container(
        child: Center(
          child: Container(
            height: 300,
            width: 300,
            child: CustomPaint(
              painter: MyPainter(),
            ),
          ),
        ),
      ),
    );
  }
}