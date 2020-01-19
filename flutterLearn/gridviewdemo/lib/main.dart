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
        appBar: AppBar(
          title: Text('GridViewDemo'),
        ),
        body: LayoutDemo2(),
      ),
    );
  }
}


class LayoutDemo2 extends StatelessWidget{

   Widget _getDataList(context, index){
      return Container(
        child: Column(
          children: <Widget>[
            Image.network(listData[index]['imageUrl']),
            SizedBox(
              height: 15,
            ),
            Text(
              listData[index]['title'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),  
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(233, 233, 233, 0.9),
            width: 1,
          )
        ),
       );
   }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: listData.length,
      itemBuilder: this._getDataList,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        crossAxisCount: 2,
      ),
    );
  }

}

 class LayoutDemo1 extends StatelessWidget{

   List<Widget> _getDataList(){
     return listData.map((value){
       return Container(
        child: Column(
          children: <Widget>[
            Image.network(value['imageUrl']),
            SizedBox(
              height: 15,
            ),
            Text(
              value['title'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),  
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(233, 233, 233, 0.9),
            width: 1,
          )
        ),
       );
     }).toList();
   }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,


      crossAxisCount: 2,
      children: this._getDataList(),
    );
  }

 }



class LayoutDemo extends StatelessWidget{
  List<Widget> _getListData(){
    List<Widget> list  = new List();
    for(var i = 0; i < 20; ++i){
      list.add(
        Container(
          alignment: Alignment.center,
          child: Text(
            '这是第$i条数据',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          color: Colors.red,
        )
      );
    }
    return list;
  }


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,

      padding: EdgeInsets.all(10),


      crossAxisCount: 3,
      childAspectRatio: 0.8, //宽度个高度的比例
      children: _getListData(),


      // crossAxisCount: 2,

      // children: <Widget>[
      //   Text('这是一个文本'),
      //   Text('这是一个文本'),
      //   Text('这是一个文本'),
      //   Text('这是一个文本'),
      //   Text('这是一个文本'),
      // ],


    );
  }
  
}