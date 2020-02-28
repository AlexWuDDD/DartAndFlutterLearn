import 'dart:math';

import 'package:flutter/material.dart';

const BLUE_NORMAL = Color(0xff54c5f8);
const GREEN_NORMAL = Color(0xff6bde54);
const BLUE_DARK2 = Color(0xff01579b);
const BLUE_DARK1 = Color(0xff29b6f6);



class SizeUtil{
  static const _DESIGN_WIDTH = 580;
  static const _DESIGN_HEIGHT = 648;

  //logic size indevice
  static Size _logicSize = Size(100, 100);

  //device pixel radio

  static get width {
    return _logicSize.width;
  }

  static get height{
    return _logicSize.height;
  }

  static set size(size){
    _logicSize = size;
  }

  //可以输入原图的位置，然后转换成现有的设备对应的尺寸
  static double getAxisX(double w){
    return (w * width) / _DESIGN_WIDTH;
  }

  static double getAxisY(double h){
    return (h * height) / _DESIGN_HEIGHT;
  }

  static double getAxisBoth(double s){
    return s * sqrt((width*width + height*height)/(_DESIGN_WIDTH * _DESIGN_WIDTH + _DESIGN_HEIGHT * _DESIGN_HEIGHT));
  }
}

//SizeUtil.size = MediaQuery.of(context).size;

class OpenPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    if(size.width > 1.0 && size.height > 1.0){
      print(">1.9");
      SizeUtil.size = size;
    }

    myPainter.color = BLUE_NORMAL;
    _drawFourShape(canvas, 
      left_top: Offset(291, 178), 
      right_top: Offset(580, 458), 
      right_bottom: Offset(580, 648), 
      left_bottom: Offset(203, 267), 
      paint: myPainter);

    myPainter.color = BLUE_DARK1;  
    _drawFourShape(canvas, 
      left_top: Offset(156, 314), 
      right_top: Offset(245, 402), 
      right_bottom: Offset(157, 490), 
      left_bottom: Offset(79, 402), 
      paint: myPainter);

    myPainter.color = BLUE_DARK2;  
    _drawFourShape(canvas, 
      left_top: Offset(70, 402), 
      right_top: Offset(100, 480), 
      right_bottom: Offset(4,  643), 
      left_bottom: Offset(4, 467), 
      paint: myPainter);      

    myPainter.color = BLUE_NORMAL;
    _drawFourShape(canvas, 
      left_top: Offset(245, 402), 
      right_top: Offset(312, 468), 
      right_bottom: Offset(312, 645), 
      left_bottom: Offset(157, 490), 
      paint: myPainter);

    print("circle - ${circleCenter.dx} - ${circleCenter.dy}");
    myPainter.color = BLUE_NORMAL;
    canvas.drawCircle(circleCenter, SizeUtil.getAxisBoth(174), myPainter);
    myPainter.color = GREEN_NORMAL;
    canvas.drawCircle(circleCenter, SizeUtil.getAxisBoth(124), myPainter);
    myPainter.color = Colors.white;
    canvas.drawCircle(circleCenter, SizeUtil.getAxisBoth(80), myPainter);

    canvas.save();
    canvas.restore();
  }

  var myPainter = Paint()
    ..style = PaintingStyle.fill
    ..color = BLUE_NORMAL
    ..isAntiAlias = true;

  void _drawFourShape(Canvas canvas, {Offset left_top, Offset right_top, Offset right_bottom, Offset left_bottom,
    Paint paint}){
      left_top = _converLogicSize(left_top);
      right_top = _converLogicSize(right_top);
      right_bottom = _converLogicSize(right_bottom);
      left_bottom = _converLogicSize(left_bottom);

      var path = Path()
        ..moveTo(left_top.dx,left_top.dy)
        ..lineTo(right_top.dx, right_top.dy)
        ..lineTo(right_bottom.dx, right_bottom.dy)
        ..lineTo(left_bottom.dx, left_bottom.dy);

      canvas.drawPath(path, paint);
  } 

  var circleCenter = Offset(SizeUtil.getAxisX(294), SizeUtil.getAxisY(175));

  Offset _converLogicSize(Offset off){
    return Offset(SizeUtil.getAxisX(off.dx), SizeUtil.getAxisY(off.dy));
  }  

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}

class Logo extends StatefulWidget {
  Logo({Key key}) : super(key: key);

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    Size myDeviceSize = MediaQuery.of(context).size;
    print("width : ${myDeviceSize.width}, height: ${myDeviceSize.height}");
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGO Demo"),
      ),
      body: Container(
        child: Center(
          child: Container(
            width: 120,
            height: 140,
            child: CustomPaint(
              painter: OpenPainter(),
            ),
          ),
        ),
      )
    );
  }
}