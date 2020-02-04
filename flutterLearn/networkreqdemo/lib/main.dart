import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Map转化成json
    Map userinfo = {
      'username':'张三',
      'age':20,
    };
    print(json.encode(userinfo));

    var a = json.encode(userinfo);
    print(userinfo is Map);
    print(a is String);

    String info = '{"userinfo":"张三", "age":20}';
    var b = json.decode(info);
    print(b is Map);
    print(b['userinfo']);
    //print(b);

    this._getReq();
  }

  List _newslist = [];

  void _getReq() async{
    var apiKey = '9d7b40e101b7c35acc8c5b8f044558e3';
    var newsNum = 10;
    var apiUrl = 'http://api.tianapi.com/guonei/index'+ '?key=' + apiKey + "&num=" + newsNum.toString();

    print("我的请求: " + apiUrl);
    // Await the http get response, then decode the json-formatted response.
    var result = await http.get(apiUrl);
    if (result.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();
      var response = utf8decoder.convert(result.bodyBytes);
      print(json.decode(response));
      
      setState(() {
        this._newslist = json.decode(response)['newslist'];
        print(this._newslist);
        print(this._newslist.length);
      });

    } 
    else {
      print('Request failed with status: ${result.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网络请求Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: this._newslist.length > 0 ? 
                ListView(
                  children: this._newslist.map((value){
                      return ListTile(
                        leading: Image.network(value['picUrl'], fit: BoxFit.cover),
                        title: Text(value['title']),
                        contentPadding: EdgeInsets.all(5),
                      );
                    }
                  ).toList()
                ):
                Text('加载中....'),
      ),
    );
  }
}