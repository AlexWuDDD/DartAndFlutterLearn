import 'package:flutter/material.dart';
import 'package:visibility/MyVisibility.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestLayOut(),
    );
  }
}

class TestLayOut extends StatelessWidget {
  const TestLayOut({Key key}) : super(key: key);

  Widget myContainer(Color color){
    return Container(
      //margin: EdgeInsets.all(20),
      height: 100,
      width: 100,
      color: color,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.grey,
      child: ListView(
        children: <Widget>[
          MyVisibility(child: myContainer(Colors.black), visibility: VisibilityFlag.visible,),
          MyVisibility(child: myContainer(Colors.white), visibility: VisibilityFlag.invisible),
          MyVisibility(child: myContainer(Colors.redAccent), visibility: VisibilityFlag.offscreen),
          MyVisibility(child: myContainer(Colors.greenAccent), visibility: VisibilityFlag.visible),
          MyVisibility(child: myContainer(Colors.blueAccent), visibility: VisibilityFlag.visible),
          MyVisibility(child: myContainer(Colors.orange), visibility: VisibilityFlag.visible),
        ],
      ),
    );
  }
}