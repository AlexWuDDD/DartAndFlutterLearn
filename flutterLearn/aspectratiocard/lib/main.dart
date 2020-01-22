import 'package:flutter/material.dart';
import 'listData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AspectRation Card Demo'),
        ),
        body: CardDemo3(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text('Alex is cool');
  }
}

class CardDemo3 extends StatelessWidget{
  
  List<Widget> _getListDate(){
    return listData.map((value){
      return Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 20/9,
                child: Image.network(value['imageUrl'], fit: BoxFit.cover,),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(value['imageUrl']),
                ),
                title: Text(value['title']),
                subtitle: Text(
                  value['description'], 
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  ),
              )
            ],
          ),
        );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this._getListDate(),
    );
  }
  
}



class CardDemo2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 20/9,
                child: Image.network('https://www.itying.com/images/flutter/1.png', fit: BoxFit.cover,),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://www.itying.com/images/flutter/1.png'),
                ),
                title: Text('xxxxxxx'),
                subtitle: Text('xxxxxx'),
              )
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 20/9,
                child: Image.network('https://www.itying.com/images/flutter/2.png', fit: BoxFit.cover,),
              ),
              ListTile(
                leading: ClipOval(
                  child: Image.network(
                    'https://www.itying.com/images/flutter/2.png', 
                    fit: BoxFit.cover, 
                    height: 60, 
                    width: 60,
                  ),
                ),
                title: Text('xxxxxxx'),
                subtitle: Text('xxxxxx'),
              )
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 20/9,
                child: Image.network('https://www.itying.com/images/flutter/3.png', fit: BoxFit.cover,),
              ),
              ListTile(
                leading: ClipOval(
                  child: Image.network(
                    'https://www.itying.com/images/flutter/3.png', 
                    fit: BoxFit.cover, 
                    height: 60, 
                    width: 60,
                  ),
                ),
                title: Text('xxxxxxx'),
                subtitle: Text('xxxxxx'),
              )
            ],
          ),
        )        
      ],
    );
  }
  
}







class CardDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('张三', style: TextStyle(fontSize: 28),),
                subtitle: Text('高级软件工程师'),
              ),
              ListTile(
                title: Text('电话: xxxxxxxxx'),
              ),
              ListTile(
                title: Text('地址: xxxxxxxxxx'),
              )
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('李四', style: TextStyle(fontSize: 28),),
                subtitle: Text('软件工程师'),
              ),
              ListTile(
                title: Text('电话: xxxxxxxxx'),
              ),
              ListTile(
                title: Text('地址: xxxxxxxxxx'),
              )
            ],
          ),
        )
      ],
    );
  }
}





class AspectRationDemo2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 3.0/1.0,//高度是宽度的1/3
        child: Container(
          color: Colors.red,
        ),
      );
  }
}



class AspectRationDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: AspectRatio(
        aspectRatio: 2.0/1.0,
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}