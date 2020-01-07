import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image App Demo"),
        ),
        body: HomeContent(),
      )
    );
  }
}

class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // //远程图片
        // child: Image.network(
        //   'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578375197075&di=81d25600925fc70afa2110e66aca90fc&imgtype=0&src=http%3A%2F%2Fs01.lmbang.com%2FM00%2FBD%2F45%2FecloD1v_eBCARrRsAAA4dd7MSCo070.jpg',
        //   //alignment: Alignment.center,
        //   // color: Colors.yellow,
        //   // colorBlendMode: BlendMode.modulate,
        //   fit: BoxFit.cover,
        //   ),
        // width:300,
        // height: 300,
        // decoration: BoxDecoration(
        //   color: Colors.red,
        //   // borderRadius: BorderRadius.all(
        //   //   Radius.circular(150),
        //   // )
        //   borderRadius: BorderRadius.circular(150),
        //   image:DecorationImage(
        //     image: NetworkImage(
        //       'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578375197075&di=81d25600925fc70afa2110e66aca90fc&imgtype=0&src=http%3A%2F%2Fs01.lmbang.com%2FM00%2FBD%2F45%2FecloD1v_eBCARrRsAAA4dd7MSCo070.jpg'
        //       ),
        //     fit: BoxFit.cover  
        //   )
        // ),
        // child: ClipOval(
        //   child: Image.network(
        //     'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578375197075&di=81d25600925fc70afa2110e66aca90fc&imgtype=0&src=http%3A%2F%2Fs01.lmbang.com%2FM00%2FBD%2F45%2FecloD1v_eBCARrRsAAA4dd7MSCo070.jpg',
        //     height: 100,
        //     width: 100, 
        //     fit: BoxFit.cover,
        //   ),
        // ),
        //本地图片
        child: Image.asset(
          'images/pic1.jpeg',
          fit: BoxFit.cover
          ),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
        )
    );
  }
  
}