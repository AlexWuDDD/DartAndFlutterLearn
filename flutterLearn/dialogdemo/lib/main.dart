import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Demo1(),
    );
  }
}

class Demo1 extends StatefulWidget {
  Demo1({Key key}) : super(key: key);

  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {

  void _alertDialog() async{
    var res = await showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("提示信息"),
          content: Text('您确定要删除吗？'),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                print('取消');
                Navigator.pop(context, 'cancle');
              }, 
              child: Text('取消')
            ),
            FlatButton(
              onPressed: (){
                print('确定');
                Navigator.pop(context, 'ok');
              }, 
              child: Text('确定')
            ),

          ],
        );
      }
    );

    print(res);
  }

  void _simpleDialog() async{
    var res = await showDialog(
      context: context,
      builder: (context){
        return SimpleDialog(
          title: Text('选择内容'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Option A'),
              onPressed: (){
                print('Option A');
                Navigator.pop(context, 'A');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('Option B'),
              onPressed: (){
                print('Option B');
                Navigator.pop(context, 'B');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('Option C'),
              onPressed: (){
                print('Option C');
                Navigator.pop(context, 'C');
              },
            ),
          ],
        );
      }
    );

    print(res);

  }

  void _modelBottonSheet() async{
    var res = await showModalBottomSheet(
      context: context, 
      builder: (context){
        return Container(
          height: 200,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('分享 A'),
                onTap: (){
                  Navigator.pop(context, 'A');
                },
              ),
              Divider(),
              ListTile(
                title: Text('分享 B'),
                onTap: (){
                  Navigator.pop(context, 'B');
                },
              ),
              Divider(),
              ListTile(
                title: Text('分享 C'),
                onTap: (){
                  Navigator.pop(context, 'C');
                },
              ),
            ],
          ),
        );
      },
    );

    print(res);

  }

  void _toast() {
    Fluttertoast.showToast(
            msg: "提示信息",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diaglog Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('aler弹出框 - AlertDialog'),
              onPressed: _alertDialog,
            ),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text('select弹出框 - SimpleDialog'),
              onPressed: _simpleDialog,
            ),
            SizedBox(height: 20,),
                      RaisedButton(
              child: Text('ActionSheet弹出框 - showModalBottomSheet'),
              onPressed: _modelBottonSheet,
            ),
            SizedBox(height: 20,),
                      RaisedButton(
              child: Text('toast-fluttertoast第三方库'),
              onPressed: _toast,
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
      
    );
  }
}