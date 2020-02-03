import 'package:flutter/material.dart';
import 'components/MyDialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  Demo({Key key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {

  void _selfDiaglog(){
    showDialog(
      context: context,
      builder: (context){
        return MyDialog('关于我', 'Alex is cool!');
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义Dialog'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:< Widget>[
                RaisedButton(
                  child: Text('显示自定义Dialog'),
                  onPressed: _selfDiaglog,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}