import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: buttonDemo1(),
    );
  }
}

class buttonDemo1 extends StatelessWidget {
  const buttonDemo1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Demo1'),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.settings),
            onPressed: (){},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('普通按钮'),
                color: Colors.yellow,
                textColor: Colors.blue,
                elevation: 10,
                onPressed: (){
                  print('普通按钮');
                },
              ),
              SizedBox(width: 10,),
              Container(
                height: 50,
                width: 100,
                child:RaisedButton(
                  child: Text('普通按钮'),
                  color: Colors.yellow,
                  textColor: Colors.blue,
                  elevation: 10,
                  onPressed: (){
                    print('普通按钮怎么限制大小');
                  },
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text('自适应按钮'),
                  onPressed: (){
                    print('自适应按钮');
                  },
                )
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton.icon(
                icon: Icon(Icons.settings),
                label: Text('图标按钮'),
                onPressed: (){
                  print('图标按钮');
                },
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('圆角按钮'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: (){},
              ),
              SizedBox(width: 10,),
              Container(
                height: 80,
                width: 80,
                child:RaisedButton(
                  child: Text('圆形按钮'),
                  splashColor: Colors.green,//长按
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.white
                    ),
                  ),
                  onPressed: (){},
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('扁平按钮'),
                color: Colors.pink,
                textColor: Colors.blueGrey,
                onPressed: (){},
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                child: Text('边框按钮'),
                textColor: Colors.red,
                onPressed: (){},
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    child: Text('注册'),
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text('登录'),
                    onPressed: (){},
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              MyButton(text: 'alex', pressed: (){
                print('alex is cool');
              },),
            ],
          )
        ],
      )
    );
  }
}

//自定义按钮组件
class MyButton extends StatelessWidget {
  final text;
  final pressed;
  final double height;
  final double weight;
  //const MyButton({Key key}) : super(key: key);
  MyButton({this.height, this.weight, this.text = '自定义按钮', this.pressed = null});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.weight,
      child: RaisedButton(
        child: Text(this.text),
        onPressed: this.pressed,
      )
    );
  }
}