import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Demo2(),
    );
  }
}

class Demo2 extends StatefulWidget {
  Demo2({Key key}) : super(key: key);

  @override
  _Demo2State createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {

  String username;
  int sex;
  List hobby = [
    {
      'checked':true,
      'title': '吃饭',
    },
    {
      'checked':false,
      'title': '睡觉',
    },
    {
      'checked':true,
      'title': '写代码',
    }
  ];
  String info;

  void _sexChanged(value){
    setState(() {
      this.sex = value;
    });
  }

  List<Widget> _getListHobby(){

    List<Widget> tempList = [];
    for(var i = 0; i < this.hobby.length; ++i){
      tempList.add(
        Row(
          children: <Widget>[
            Text(this.hobby[i]['title'] + ": "),
            Checkbox(
              value: this.hobby[i]["checked"], 
                onChanged: (value){
                setState(() {
                  this.hobby[i]['checked'] = value;
                  });
                })
          ],
        )
      );
    }
    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表单综合Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('学员信息登记系统'),
              ],
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                hintText: '输入用户信息',
              ),
              onChanged: (v){
                this.username = v;
              },
            ),
            Row(
              children: <Widget>[
                Text('男'),
                Radio(
                  value: 1, 
                  groupValue: this.sex, 
                  onChanged: this._sexChanged,
                ),
                Text('女'),
                Radio(
                  value: 2, 
                  groupValue: this.sex, 
                  onChanged: this._sexChanged,
                ),
              ],
            ),
            SizedBox(height:20),
            //爱好
            Column(
              children: this._getListHobby(),
            ),
            SizedBox(height: 20),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: '描述信息',
                border: OutlineInputBorder(),
              ),
              onChanged: (v){
                setState(() {
                  this.info = v;
                });
              },
              
            ),
            SizedBox(height:20),
            Container(
              width: double.infinity,
              height: 40,
              child: RaisedButton(
                child: Text('提交信息'),
                onPressed: (){
                  print(this.username);
                  print(this.sex == 1?'男':'女');
                  print(this.hobby);
                  print(this.info);
                }),
            )


          ],
        ),)
    );
  }
}


class Demo1 extends StatefulWidget {
  Demo1({Key key}) : super(key: key);

  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {

  var sex = 1;
  var color = 1;
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio RadioListTile Switch Demo')
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('男'),
                Radio(
                  value: 1, 
                  groupValue: this.sex, 
                  onChanged: (v){
                    setState(() {
                      this.sex = v;
                    });
                  }
                ),
                Text('女'),
                Radio(
                  value: 2, 
                  groupValue: this.sex, 
                  onChanged: (v){
                    setState(() {
                      this.sex = v;
                    });
                  }
                ),
                SizedBox(width:20),
                Text('性别：'),
                Text(this.sex==1?'男':'女'),
              ],
            ),
            SizedBox(height: 40,),
            RadioListTile(
              title: Text('黑色'),
              subtitle: Text('颜色'),
              secondary: Icon(Icons.colorize),
              value: 1, 
              groupValue: this.color, 
              onChanged: (v){
                setState(() {
                  this.color = v;
                });
              },
              selected: this.color ==1,
            ),
            RadioListTile(
              title: Text('白色'),
              subtitle: Text('颜色'),
              secondary: Icon(Icons.colorize),
              value: 2, 
              groupValue: this.color, 
              onChanged: (v){
                setState(() {
                  this.color = v;
                });
              },
              selected: this.color ==2,
            ),
            RadioListTile(
              title: Text('灰色'),
              subtitle: Text('颜色'),
              secondary: Icon(Icons.colorize),
              value: 3, 
              groupValue: this.color, 
              onChanged: (v){
                setState(() {
                  this.color = v;
                });
              },
              selected: this.color ==3,
            ),
            SizedBox(height: 20),
            Switch(
              value: this.flag, 
              onChanged: (v){
                setState(() {
                  this.flag = v;
                });
              }),
              Text('flag: ${this.flag}')

          ],
        ),
      ),
    );
  }
}