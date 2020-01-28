import 'package:flutter/material.dart';

class ProductinfoPage extends StatefulWidget {
  Map arguments;

  ProductinfoPage({Key key, this.arguments}) : super(key: key);

  @override
  _ProductinfoPageState createState() => _ProductinfoPageState(
    arguments:this.arguments
  );
}

class _ProductinfoPageState extends State<ProductinfoPage> {
  
  Map arguments;

  _ProductinfoPageState({this.arguments});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情'),
      ),
      body:Container(
        child: Text('pid = ${arguments['pid']}'),
      )
    );
  }
}