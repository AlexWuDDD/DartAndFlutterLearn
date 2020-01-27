import 'package:flutter/material.dart';
import '../form.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text('跳转到表单页面并传值'),
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>FormPage(title: '我是跳转传值',)
              ),
            );
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
      ],
    );
  }
}