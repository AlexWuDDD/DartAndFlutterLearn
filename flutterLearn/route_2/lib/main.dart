import 'package:flutter/material.dart';
import './routes/routes.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  //const MyApp({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', //初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute,
    );
  }
}