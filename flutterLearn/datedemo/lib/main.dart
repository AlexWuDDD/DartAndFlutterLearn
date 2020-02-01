//import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:date_format/date_format.dart';
void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      debugShowCheckedModeBanner: false,
      home: Demo1(),
      
    );
  }
}


class Demo1 extends StatefulWidget {
  Demo1({Key key}) : super(key: key);

  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {

  var _nowDate = DateTime.now();
  var _nowTime = TimeOfDay.now();


  void _showDatePicker() async{
    // showDatePicker(
    //   context: context, 
    //   initialDate: this._nowDate, 
    //   firstDate: DateTime(1980), 
    //   lastDate: DateTime(2100),
    // ).then((result){
    //   print(result);
    // });

    var result =  await showDatePicker(
      context: context, 
      initialDate: this._nowDate, 
      firstDate: DateTime(1980), 
      lastDate: DateTime(2100),
      locale: Locale('zh'),
    );
    if(result == null){
      print('nothing chosed');
      return;
    }
    print(result);
    setState(() {
      this._nowDate = result;
    });
  }

  void _showTimePicker() async{
    var result = await showTimePicker(
      context: context, 
      initialTime: this._nowTime,
    );

    if(result == null){
      print('nothing chosed');
      return;
    }
    print(result);
    setState(() {
      this._nowTime = result;
    });


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(now);
    // print(now.millisecondsSinceEpoch);
    // print(DateTime.fromMillisecondsSinceEpoch(1580524750906));
    // print(formatDate(DateTime.now(), [yyyy, '年', mm, '月', dd, '日']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日期和时间戳'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${this._nowDate.year}年${this._nowDate.month}月${this._nowDate.day}日'),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              onTap: (){
                print('打开日期组件');
                this._showDatePicker();
              },
            ),
            SizedBox(height: 20,),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${this._nowTime.format(context)}'),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              onTap: this._showTimePicker,
            )
          ],
        ),
      )
    );
  }
}