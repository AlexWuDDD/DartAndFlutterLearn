import 'package:flutter/material.dart';
class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('设置 1'),
        ),
        ListTile(
          title: Text('设置 2'),
        ),
        ListTile(
          title: Text('设置 3'),
        ),
        ListTile(
          title: Text('设置 4'),
        ),
        ListTile(
          title: Text('设置 5'),
        ),
      ],);
  }
}