import 'package:flutter/material.dart';
import 'listData.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('List View 2 demo')),
        body: HomeContent(),
        ),
    );
  }
}

class HomeContent extends StatelessWidget{

  //自定义方法
  // List<Widget> _getData(){
  //   var tempList = listData.map((value){
  //     return ListTile(
  //       leading: Image.network(value['imageUrl']),
  //       title: Text(value['title']),
  //       subtitle: Text(value['author']),

  //     );
  //   });

  //   return tempList.toList();
  //   // List<Widget> list = new List();
  //   // for(var i = 0; i < 20; i++){
  //   //   list.add(ListTile(
  //   //     title: Text('我是$i列表'),)
  //   //   );
  //   // }
  //   // return list;

  //   // return [
  //   //     ListTile(
  //   //       title: Text('我是一个列表1'),
  //   //     ),
  //   //     ListTile(
  //   //       title: Text('我是一个列表2'),
  //   //     ),
  //   //     ListTile(
  //   //       title: Text('我是一个列表3'),
  //   //     ),
  //   //   ];
  // }

  //ListViewBuilder
  // List list = new List();

  // HomeContent(){
  //   for(var i = 0; i < 20; i++){
  //     this.list.add('我是第$i条');
  //   }
  // }


  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(
  //     itemCount: this.list.length,
  //     itemBuilder: (context, index){
  //         return ListTile(
  //           title: Text(this.list[index]),
  //         );
  //     },
  //   );
  // }

  Widget _getListData(context, index){
    return ListTile(
      leading: Image.network(listData[index]['imageUrl']),
      title: Text(listData[index]['title']),
      subtitle: Text(listData[index]['author']),
    );
  }


    @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: this._getListData,
    );
  }
  
}