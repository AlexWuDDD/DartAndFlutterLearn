import 'package:canvasdemo/logo.dart';
import 'package:flutter/material.dart';

import 'CanvasDemo1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Logo()
    );
  }
}