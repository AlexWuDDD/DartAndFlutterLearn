import 'package:animation/MyAnimation1.dart';
import 'package:animation/MyAnimation2.dart';
import 'package:animation/MyAnimation3.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAnimation3(),
    );
  }
}

