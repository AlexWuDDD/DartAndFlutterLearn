import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App02'),
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Container(
            child: Text(
              '我是一个文本',
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 25.0,
                color: Color.fromRGBO(100, 100, 10, 0.5),
                //fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.white,
                decorationStyle: TextDecorationStyle.dotted,
                letterSpacing: 5.0,
              ),

            ),
            height: 300.0,
            width: 300.0,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(
                color: Colors.blue,
                width: 5.0
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            padding: EdgeInsets.all(20),

            margin: EdgeInsets.all(90),
            //transform: Matrix4.translationValues(100, 0, 0),
            //transform: Matrix4.rotationZ(-0.3),
            alignment: Alignment.topRight
          )
          );
  }  
}