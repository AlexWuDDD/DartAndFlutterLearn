import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去掉debug图标
      home: Demo2(),
    );
  }
}

class Demo2 extends StatelessWidget {
  const Demo2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(
                child: TabBar(
                  indicatorColor: Colors.red,
                  labelColor: Colors.yellow,
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: <Widget>[
                    Tab(text: '热门',),
                    Tab(text: '推荐'),
                  ],
              )),
            ],
          ),


        ),
        // appBar: AppBar(
        //   title: Text('tab 切换'),
        //   bottom: TabBar(
        //     tabs: <Widget>[
        //       Tab(text: '热门',),
        //       Tab(text: '推荐'),
        //     ],
        //   ),
        // ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('第一个tab'),
                ),
                ListTile(
                  title: Text('第一个tab'),
                ),
                ListTile(
                  title: Text('第一个tab'),
                ),
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('第二个tab'),
                ),
                ListTile(
                  title: Text('第二个tab'),
                ),
                ListTile(
                  title: Text('第二个tab'),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}


class Demo1 extends StatelessWidget {
  const Demo1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App Bar demo'),
          centerTitle: true,
          backgroundColor: Colors.red,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed:(){
              print('menu');
            }
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed:(){
                  print('search');
              }
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed:(){
                  print('settings');
              }
            ),
          ],
        ),
        body: Text('11111'),
      );
  }
}