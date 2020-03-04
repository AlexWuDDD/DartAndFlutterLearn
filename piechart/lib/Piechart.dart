

import 'package:flutter/material.dart';
import 'package:piechart/PiechartPainter.dart';

class Piechart extends StatefulWidget {
  Piechart({Key key}) : super(key: key);

  @override
  _PiechartState createState() => _PiechartState();
}

class _PiechartState extends State<Piechart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pie Chart Demo"),
      ),
      body: Container(
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: PiechartPainter(),
            )
          ),
        ),
      ),
    );
  }
}