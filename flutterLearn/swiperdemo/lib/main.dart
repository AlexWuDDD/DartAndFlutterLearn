import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Demo4(),
    );
  }
}

class Demo4 extends StatefulWidget {
  Demo4({Key key}) : super(key: key);

  @override
  _Demo4State createState() => _Demo4State();
}

class _Demo4State extends State<Demo4> {

    List<Map> imageList = [
      {'url':'https://www.itying.com/images/flutter/1.png'},
      {'url':'https://www.itying.com/images/flutter/2.png'},
      {'url':'https://www.itying.com/images/flutter/3.png'},
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('轮播Demo'),
      ),
      body: Swiper(
        layout: SwiperLayout.CUSTOM,
        customLayoutOption: new CustomLayoutOption(
            startIndex: -1,
            stateCount: 3
        ).addRotate([
          -45.0/180,
          0.0,
          45.0/180
        ]).addTranslate([
          new Offset(-370.0, -40.0),
          new Offset(0.0, 0.0),
          new Offset(370.0, -40.0)
        ]),
        itemWidth: 300.0,
        itemHeight: 200.0,
        itemBuilder: (context, index) {
          return new Container(
            //color: Colors.grey,
            child: new Center(
              child: Image.network(this.imageList[index]['url'],
                fit: BoxFit.contain ,),
            ),
          );
        },
        itemCount: this.imageList.length
      ),
    );
  }
}


class Demo3 extends StatefulWidget {
  Demo3({Key key}) : super(key: key);

  @override
  _Demo3State createState() => _Demo3State();
}

class _Demo3State extends State<Demo3> {
  List<Map> imageList = [
      {'url':'https://www.itying.com/images/flutter/1.png'},
      {'url':'https://www.itying.com/images/flutter/2.png'},
      {'url':'https://www.itying.com/images/flutter/3.png'},
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('轮播图Demo2'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: AspectRatio(
              aspectRatio: 16/9,
              child:Swiper(
                itemBuilder: (BuildContext context,int index){
                  return Image.network(
                    this.imageList[index]['url'],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: this.imageList.length,
                pagination: SwiperPagination(),
                control: SwiperControl(),
                //自动轮播
                loop: true,
                autoplay: true,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Text('我是一个文本'),
            ],
          ),
        ],
      ),
    );
  }
}



class Demo2 extends StatefulWidget {
  Demo2({Key key}) : super(key: key);

  @override
  _Demo2State createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {

  List<Map> imageList = [
    {'url':'https://www.itying.com/images/flutter/1.png'},
    {'url':'https://www.itying.com/images/flutter/2.png'},
    {'url':'https://www.itying.com/images/flutter/3.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('轮播图Demo2'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: AspectRatio(
              aspectRatio: 16/9,
              child:Swiper(
                itemBuilder: (BuildContext context,int index){
                  return Image.network(
                    this.imageList[index]['url'],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: this.imageList.length,
                pagination: SwiperPagination(),
                control: SwiperControl(),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Text('我是一个文本'),
            ],
          ),
        ],
      ),
    );
  }
}




class Demo1 extends StatefulWidget {
  Demo1({Key key}) : super(key: key);

  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {

  List<Map> imageList = [
    {'url':'https://www.itying.com/images/flutter/1.png'},
    {'url':'https://www.itying.com/images/flutter/2.png'},
    {'url':'https://www.itying.com/images/flutter/3.png'},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('轮播图 Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return Image.network(
              this.imageList[index]['url'],
              fit: BoxFit.fill,
            );
          },
          itemCount: this.imageList.length,
          pagination: SwiperPagination(),
          control: SwiperControl(),
        ),
      ),

    );
  }
}