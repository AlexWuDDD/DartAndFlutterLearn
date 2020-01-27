import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Warp Demo'),
        ),
        body: WrapDemo2(),
      )
    );
  }
}

class WrapDemo2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 400,
      color: Colors.pink,
      padding: EdgeInsets.all(10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        direction: Axis.vertical,
        //runAlignment: WrapAlignment.spaceAround,
        children: <Widget>[
          MyButton('a'),
          MyButton('abbb'),
          MyButton('ab'),
          MyButton('adwecwqcw'),
          MyButton('asadcwcweww'),
          MyButton('acwcwec'),
          MyButton('afdverve'),
          MyButton('a'),
          MyButton('a'),
          MyButton('a'),
          MyButton('a'),
          MyButton('a'),
        ],
      ),
    );
  }
  
}

class WrapDemo1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: <Widget>[
        MyButton('a'),
        MyButton('abbb'),
        MyButton('ab'),
        MyButton('adwecwqcw'),
        MyButton('asadcwcweww'),
        MyButton('acwcwec'),
        MyButton('afdverve'),
        MyButton('a'),
        MyButton('a'),
        MyButton('a'),
        MyButton('a'),
        MyButton('a'),
      ],
    );
  }
  
}

class MyButton extends StatelessWidget{

  final String _text;

  MyButton(this._text);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(_text),
      textColor: Theme.of(context).accentColor,
      onPressed: (){},
    );
  }
  
}
