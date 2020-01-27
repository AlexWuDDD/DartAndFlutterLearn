import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateful Widget Demo'),
        ),
        body: Demo3(),
      )
    );
  }
}


class Demo3 extends StatefulWidget {
  Demo3({Key key}) : super(key: key);

  @override
  _Demo3State createState() => _Demo3State();
}

class _Demo3State extends State<Demo3> {
  List list = new List();


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: this.list.map((value){
            return ListTile(
              title: Text(value),
            );
          }).toList(),
        ),
        SizedBox(height: 20,),
        RaisedButton(
          child: Text('按钮'),
          onPressed: (){
            setState(() {
              this.list.add('新增数据1');
              this.list.add('新增数据2');
            });
          },
        )
      ],
    );
  }
}


//自定义有状态组件
class Demo2 extends StatefulWidget {
  Demo2({Key key}) : super(key: key);

  @override
  _Demo2State createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  int countNum = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 200,),
        Chip(
          label: Text('${this.countNum}'),
        ),
        SizedBox(height: 20,),
        RaisedButton(
          child: Text('按钮'),
          onPressed: (){
            setState(() { //只有有状态组件里里面才有
              this.countNum++;
            });
          },
        )
      ],
    );

  }
}



class Demo1 extends StatelessWidget{
  int countNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 200,),
        Text('${this.countNumber}'),
        SizedBox(height: 20,),
        RaisedButton(
          child: Text('按钮'),
          onPressed: (){
            this.countNumber++;
            print(this.countNumber);
          },
        )
      ],
    );
  }
}

