import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Demo3(),
    );
  }
}

class Demo3 extends StatefulWidget {
  Demo3({Key key}) : super(key: key);

  @override
  _Demo3State createState() => _Demo3State();
}

class _Demo3State extends State<Demo3> {

  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CheckBox Demo'),),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                value: this.flag,
                onChanged: (value){
                  setState(() {
                    this.flag = value;
                    print(this.flag);
                  });
                },
                activeColor: Colors.red,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(this.flag?'选中':'未选中'),
            ],
          ),
          SizedBox(height: 20,),
          CheckboxListTile(
            value: this.flag,
            onChanged: (value){
              setState(() {
                this.flag = value;
              });
            },
            title: Text('标题'),
            subtitle: Text('二级标题'),
          ),
          Divider(),
          CheckboxListTile(
            value: this.flag,
            onChanged: (value){
              setState(() {
                this.flag = value;
              });
            },
            title: Text('标题'),
            subtitle: Text('二级标题'),
            secondary: Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}




class Demo2 extends StatefulWidget {
  Demo2({Key key}) : super(key: key);

  @override
  _Demo2State createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {

  var username = new TextEditingController();
  var password = new TextEditingController();

  @override
  void initState() {
    super.initState();
    username.text = '初始值';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFiled Demo 2'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: '请输入用户名'
              ),
              controller: username,
              onChanged: (value){
                setState(() {
                  username.text = value;
                });
              },
            ),
            SizedBox(height: 20,),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: '密码',
              ),
              controller: password,
              onChanged: (value){
                password.text = value;
              },
            ),
            SizedBox(height: 20,),
            Container(
              child: RaisedButton(
                child: Text('登入'),
                onPressed: (){
                  print(username.text);
                  print(password.text);
                },
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class Demo1 extends StatelessWidget {
  const Demo1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFiled Demo 1'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              hintText: '请输入搜索内容',
              border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "多行文本框",
              border: OutlineInputBorder()
            )
          ),
          SizedBox(height: 10,),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "密码框",
              border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '用户名',
            ),
          ),
          SizedBox(height: 5,),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '密码',
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.people),
              hintText: "请输入用户名",
              border: OutlineInputBorder()
            ),
          ),
        ],
      )
    );
  }
}