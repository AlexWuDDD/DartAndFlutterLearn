import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Listview Demo'),
        ),
        body: HomeContent(),
      ),
      
    );
  }
}

class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   padding: EdgeInsets.all(20),
    //   children: <Widget>[
    //     ListTile(
    //       leading:Icon(Icons.settings, size: 40),
    //       title: Text('今天是2020年1月8号'),
    //       subtitle: Text('天气很冷'),
    //     ),
    //     ListTile(
    //       leading: Icon(Icons.home, color: Colors.red,),
    //       title: Text("aaaaaaaaaaaaaaaa"),
    //       subtitle: Text('bbbbbbbbb'),
    //       trailing: Icon(Icons.pages),
    //     ),
    //     ListTile(
    //       leading: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578458727202&di=127e60464ac36a7c86edd335c9c818b2&imgtype=jpg&src=http%3A%2F%2Fimg3.imgtn.bdimg.com%2Fit%2Fu%3D3746414373%2C1329877417%26fm%3D214%26gp%3D0.jpg'),
    //       title: Text("cccccccccccccccc"),
    //       subtitle: Text('ddddddddddd'),
    //     )
    //   ],
    // );

    // return ListView(
    //   padding: EdgeInsets.all(10),
    //   children: <Widget>[
    //     Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578458727202&di=127e60464ac36a7c86edd335c9c818b2&imgtype=jpg&src=http%3A%2F%2Fimg3.imgtn.bdimg.com%2Fit%2Fu%3D3746414373%2C1329877417%26fm%3D214%26gp%3D0.jpg'),
    //     Container(
    //       child: Text(
    //         '我是一个标题', 
    //         textAlign: TextAlign.center,
    //         style: TextStyle(
    //           fontSize: 32,
    //         ),
    //         ),
    //       height: 40,
    //     ),
    //     Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578458727202&di=127e60464ac36a7c86edd335c9c818b2&imgtype=jpg&src=http%3A%2F%2Fimg3.imgtn.bdimg.com%2Fit%2Fu%3D3746414373%2C1329877417%26fm%3D214%26gp%3D0.jpg'),
    //     Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578458727202&di=127e60464ac36a7c86edd335c9c818b2&imgtype=jpg&src=http%3A%2F%2Fimg3.imgtn.bdimg.com%2Fit%2Fu%3D3746414373%2C1329877417%26fm%3D214%26gp%3D0.jpg'),
    //   ],
    // );

    return Container(
      height: 180,  
      child: ListView(
        scrollDirection: Axis.horizontal, //水平列表
        children: <Widget>[
          Container(
            //height: 100, 没用
            width: 100,
            color: Colors.red,
          ),
          Container(
            //height: 100,
            width: 100,
            color: Colors.green,
            child: ListView(
              children: <Widget>[
                Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578459957666&di=54f247ce883379d0afef4eeb56df0ca9&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fq_mini%2Cc_zoom%2Cw_640%2Fupload%2F20170802%2Fd378da6f9bfa4c688165358f4a14a814_th.jpg'),
                Text('我是一个文本'),
              ],
            ),
          ),
          Container(
            //height: 100,
            width: 100,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  
}

