import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

//自定义组件
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App01'),
        ),
        body: HomeContent(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
    );
  }
}


class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '你好 Alex',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40.0,
          color: Color.fromRGBO(100, 200, 202, 0.5)
        ),
      ));
  }
}