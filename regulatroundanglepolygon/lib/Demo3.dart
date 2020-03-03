

import 'package:flutter/material.dart';
import 'package:regulatroundanglepolygon/RegularRoundPolygon.dart';

class Demo3 extends StatefulWidget {
  Demo3({Key key}) : super(key: key);

  @override
  _Demo3State createState() => _Demo3State();
}

class _Demo3State extends State<Demo3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("regular angle polygon"),
      ),
      body: Container(
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: RegularRoundPolygon(),
            )
          ),
        ),
      ),
    );
  }
}