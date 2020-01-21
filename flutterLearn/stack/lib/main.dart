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
          title: Text('Stack demo'),
        ),
        body: StackExe(),
      )
    );
  }
}

class StackExe extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 200,
        color: Colors.blueGrey,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child:Image.network('https://www.itying.com/images/flutter/1.png',fit:BoxFit.fitWidth),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child:Image.network('https://www.itying.com/images/flutter/2.png', fit: BoxFit.fitWidth),
            ),
            Positioned(
              top: 100,
              left: 20,
              child: Text('Alex is cool!', style: TextStyle(
                fontSize: 32,
                color: Colors.white
              ),),
            ),
          ],
        ),
      ),
    );
  }
  
}

class StackDemo5 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: Stack(
          //alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 10,
              child:Icon(Icons.home, size: 40, color: Colors.white,),
            ),
            Positioned(
              bottom: 0,
              left: 100,
              child:Icon(Icons.search, size: 30, color: Colors.orange,),
            ),
            Positioned(
              right: 0,
              child:Icon(Icons.help, size: 60, color: Colors.black,),
            ),
          ],
        ),
      ),
    );
  }

}



class StackDemo4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: Stack(
          //alignment: Alignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child:Icon(Icons.home, size: 40, color: Colors.white,),
            ),
            Align(
              alignment: Alignment.center,
              child:Icon(Icons.search, size: 30, color: Colors.orange,),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child:Icon(Icons.help, size: 60, color: Colors.black,),
            ),
          ],
        ),
      ),
    );
  }
}

class StackDemo3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment(-1, -1),
        children: <Widget>[
          Container(
            height: 400,
            width: 300,
            color: Colors.red,
          ),
          Text('我是一个文本1',style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ))
        ],
      )
    );
  }
}

class StackDemo2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            height: 400,
            width: 300,
            color: Colors.red,
          ),
          Text('我是一个文本1',style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ))
        ],
      )
    );
  }
}

class StackDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 400,
          width: 300,
          color: Colors.red,
        ),
        Text('我是一个文本1'),
        Text('我是一个文本2'),
      ],
    );
  }
}

