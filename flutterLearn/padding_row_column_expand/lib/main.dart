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
          title: Text("Padding Row Column Expanded"),
        ),
        body: LayoutExe(),
      ),
    );
  }
}

class LayoutExe extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Row(
          children: <Widget>[
            Expanded(
              child:Container(
                height: 180,
                color: Colors.black,
                child: Text(
                  '你好Flutter',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                height: 180,
                child:Image.network('https://www.itying.com/images/flutter/1.png', fit: BoxFit.cover),
              )
            ),
            SizedBox(width: 10,),
            Expanded(
              flex: 1,
              child: Container(
                height: 180,
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 85,
                      child: Image.network('https://www.itying.com/images/flutter/2.png', fit: BoxFit.cover,),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 85,
                      child: Image.network('https://www.itying.com/images/flutter/3.png', fit: BoxFit.cover,),
                    ),
                  ],
                )
              )
            ),
          ],
        )
      ],
    );
  }
  
}



class LayoutDemo3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex:1,
          child:IconContainer(Icons.search, color: Colors.black),
        ),
        Expanded(
          flex: 2,
          child:IconContainer(Icons.home, color: Colors.orange),
        ),
      ],
    );
  }
  
}

class LayoutDemo2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 600,
      color: Colors.brown,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconContainer(Icons.search, color: Colors.black),
          IconContainer(Icons.home, color: Colors.orange),
          IconContainer(Icons.help, color: Colors.green),
        ],
      ),
    );
  }
  
}

class LayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 600,
      color: Colors.pink,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconContainer(Icons.search, color: Colors.black),
          IconContainer(Icons.home, color: Colors.orange),
          IconContainer(Icons.help, color: Colors.green),
        ],
      ),
    );
  }
  
}

class IconContainer extends StatelessWidget{

  double size = 32;
  Color color = Colors.red;
  IconData icon;

  IconContainer(this.icon, {this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: this.color,
      child: Center(
        child: Icon(
          this.icon,
          size: this.size,
          color: Colors.white,
        ),
      ),
    );
  }

}

class HomeContent extends StatelessWidget{

  List<Widget> _getlistDateImage(){
    List<Widget> list = new List();
    for(var i = 0; i < listData.length; ++i){
      list.add(Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: Image.network(
            listData[i]['imageUrl'], 
            fit: BoxFit.cover
          )
        )
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.7,
        children: _getlistDateImage(),
      ),
    );
  }

}