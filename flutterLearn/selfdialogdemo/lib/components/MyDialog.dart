import 'dart:async';

import 'package:flutter/material.dart';


class MyDialog extends Dialog{

  String title;
  String content;

  MyDialog(this.title, this.content);

  void _showTimer(context){
    //定时器
    var timer = Timer.periodic(
      Duration(milliseconds: 3000), (t){
        print(DateTime.now());
        print('执行关闭');
        Navigator.pop(context);
        t.cancel(); //取消定时器
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    print(DateTime.now());
    this._showTimer(context);
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.white,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text('${this.title}'),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: Icon(Icons.close),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Text('${this.content}'),
              ),
            ],
          ),
        ),
      )
    );
  }
}