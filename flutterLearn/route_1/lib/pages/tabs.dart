import 'package:flutter/material.dart';
import 'tabs/category.dart';
import 'tabs/home.dart';
import 'tabs/Setting.dart';


class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  int _currentIndex = 0;
  List _pageList = [
    HomePage(),
    CategoryPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('router 1 demo')
        ),
        body: this._pageList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          onTap: (int index){
            //print(index);
            setState(() {
              this._currentIndex = index;
            });
          },
          iconSize: 50,
          fixedColor: Colors.red,
          type: BottomNavigationBarType.fixed, //配置底部tabs可以有多个按钮
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('首页')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('分类')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('设置')
            ),
          ],
        ),
    );
  }
}