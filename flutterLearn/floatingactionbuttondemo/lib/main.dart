import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: demo2(),
    );
  }
}



class demo2 extends StatelessWidget {
  const demo2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('floating action button demo2'),
      ),
      floatingActionButton: Container(
        height: 58,
        width: 58,
        padding: EdgeInsets.all(6),
        //margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            print('add');
          },
      )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:[
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.category),
            title: Text('分类'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.settings),
            title: Text('发布'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.search),
            title: Text('搜索'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            title: Text('语音'),
          )
        ],
      ),
    );
  }
}



class demo1 extends StatelessWidget {
  const demo1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floating action button'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add, 
          color: Colors.black,
          size: 40,),
        backgroundColor: Colors.redAccent,
        onPressed: (){
          print('floatingActionButton');
        },
      ),
      floatingActionButtonLocation: 
        FloatingActionButtonLocation.centerFloat,
    );
  }
}