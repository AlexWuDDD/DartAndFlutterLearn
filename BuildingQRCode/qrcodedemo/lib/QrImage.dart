import 'package:flutter/material.dart';
import 'package:qr/qr.dart';
import 'package:qrcodedemo/QrPainter.dart';

class QrImage extends StatelessWidget {
  
  final QrPainter _painter;
  final Color backgroundColor;
  final EdgeInsets padding;
  final double size;

  QrImage({
    @required String data,
    this.size,
    this.padding = const EdgeInsets.all(10),
    this.backgroundColor,
    Color foregroundColor = const Color(0xFF000000),
    int version = 4,
    int errCorrectLevel = QrErrorCorrectLevel.L
  }): _painter = new QrPainter(data, foregroundColor, version, errCorrectLevel);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: backgroundColor,
      child: Padding(
        padding: this.padding,
        child: CustomPaint(
          painter: _painter,
        ),
      ),
    );
  }
}