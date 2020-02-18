import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingDemo();
  }
}


class PaddingDemo extends StatelessWidget {
  const PaddingDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.baseline,
        //erticalDirection: VerticalDirection.up,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(50),
            child: Text('Paddingd1'),
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: Text('Paddingd2'),
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: Text('Paddingd3'),
          ),
        ],
      )
    );
    
  }
}