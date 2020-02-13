import 'package:flutter/material.dart';
import 'package:planets/widgets/DetailPage.dart';
import 'package:planets/widgets/HomePage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Planets",
      home: HomePage(),
      // routes: <String, WidgetBuilder>{
      //   '/detail': (_) => DetailPage(),
      // },
    );
  }
}




