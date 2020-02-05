import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChartPage(),
    );
  }
}

class ChartPage extends StatefulWidget {
  ChartPage({Key key}) : super(key: key);

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage>  with TickerProviderStateMixin{

  final random = Random();
  AnimationController animation;
  BarTween tween;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animation = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    tween = BarTween(Bar(0.0), Bar(50.0));
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    animation.dispose();
    super.dispose();
  }

  void changeData(){
    setState(() {
        tween = BarTween(
          tween.evaluate(animation),
          Bar(random.nextDouble()*100.0),
        );
      animation.forward(from:0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: Size(200, 100),
          painter: BarChartPainter(tween.animate(animation)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: changeData,
      )
    );
  }


}

