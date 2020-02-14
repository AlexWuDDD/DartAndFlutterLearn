import 'package:flutter/material.dart';
import 'package:qr/qr.dart';

class QrPainter extends CustomPainter{

  QrPainter(
    String data,
    this.color,
    this.version,
    this.errorCorrectLevel,
  ):this._qr = new QrCode(version, errorCorrectLevel){
    _p.color = this.color;
    //configure and make the QR code data
    _qr.addData(data);
    _qr.make();
  }

  final QrCode _qr; //our qr code data
  final _p = new Paint()..style = PaintingStyle.fill;

  //properties
  final int version; //the qr code data
  final int errorCorrectLevel; //the qr code error correction level
  final Color color; // the color or the dark squares




  @override
  void paint(Canvas canvas, Size size) {
    if(size.shortestSide == 0){
      print("[QR] WARN: width or height is zero. You should set a 'size'value or nest this painter in a Widget that defines a none-zero size");
    }
    final squareSize = size.shortestSide/ _qr.moduleCount;
    for(int x = 0; x < _qr.moduleCount; ++x){
      for(int y = 0; y < _qr.moduleCount; ++y){
        if(_qr.isDark(y,x)){
          final squareRect  = new Rect.fromLTWH(x*squareSize, y*squareSize, squareSize, squareSize);
          canvas.drawRect(squareRect, _p);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if(oldDelegate is QrPainter){
      return this.color != oldDelegate.color ||
        this.errorCorrectLevel != oldDelegate.errorCorrectLevel ||
        this.version != oldDelegate.version;
    }
    return false;
  }

}