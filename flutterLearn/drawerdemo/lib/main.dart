import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: drawerDemo2(),
    );
  }
}


class drawerDemo2 extends StatelessWidget {
  const drawerDemo2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('drawer demo2'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: UserAccountsDrawerHeader(
                    accountName: Text('Alex Wu'),
                    accountEmail: Text('wkjworking@outlook.com'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage('https://www.itying.com/images/flutter/1.png'),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                        image: NetworkImage('https://www.itying.com/images/flutter/2.png'),
                        fit: BoxFit.cover,
                      )
                    ),
                    otherAccountsPictures: <Widget>[
                      Image.network('https://www.itying.com/images/flutter/3.png'),
                      Image.network('https://www.itying.com/images/flutter/4.png'),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


class drawerDemo extends StatelessWidget {
  const drawerDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('drawer demo'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child:  DrawerHeader(
                    child: Text('你好 flutter'),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://www.itying.com/images/flutter/1.png'),
                        fit: BoxFit.cover,
                      )
                      //color: Colors.yellow
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child:Icon(Icons.home)),
              title: Text('我的空间'),
              onTap: (){
                Navigator.of(context).pop();//隐藏侧边栏
                Navigator.pushNamed(context, '/');
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child:Icon(Icons.people)),
              title: Text('用户中心'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child:Icon(Icons.settings)),
              title: Text('设置中心'),
            ),
            Divider(),
          ],)
      ),
      endDrawer: Drawer(
        child: Text('alex is cool'),
      ),
    );
  }
}