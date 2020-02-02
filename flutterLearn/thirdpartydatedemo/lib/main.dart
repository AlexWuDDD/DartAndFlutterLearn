import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:date_format/date_format.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Demo1(),
    );
  }
}

class Demo1 extends StatefulWidget {
  Demo1({Key key}) : super(key: key);

  @override
  _Demo1State createState() => _Demo1State();
}

const String MIN_DATETIME = '2010-05-12';
const String MAX_DATETIME = '2021-11-25';
const String INIT_DATETIME = '2019-05-17';

class _Demo1State extends State<Demo1> {

  bool _showTitle = true;
  String _format = 'yyyy-MMMM-dd';
  DateTime _dateTime = DateTime.now();
  DateTimePickerLocale _locale = DateTimePickerLocale.en_us;

  void _showDatePicker(){
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        showTitle: _showTitle,
        confirm: Text('Done', style: TextStyle(color: Colors.red)),
        cancel: Text('Cancel', style: TextStyle(color: Colors.cyan)),
      ),
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: _dateTime,
      dateFormat: _format,
      locale: _locale,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onChange: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
    );
  }




 var _dateTime2 = DateTime.now();
 String _format2 = 'yy年M月d日    EEE,H时:m分';
 DateTimePickerLocale _locale2 = DateTimePickerLocale.zh_cn;


 void _showDateTimePicker() {
    DatePicker.showDatePicker(
      context,
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: _dateTime2,
      dateFormat: _format2,
      locale: _locale2,
      pickerTheme: DateTimePickerTheme(
        showTitle: _showTitle,
      ),
      pickerMode: DateTimePickerMode.datetime, // show TimePicker
      onCancel: () {
        debugPrint('onCancel');
      },
      onChange: (dateTime, List<int> index) {
        setState(() {
          _dateTime2 = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _dateTime2 = dateTime;
        });
      },
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第三方日期组件'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
            children: <Widget>[
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(formatDate(this._dateTime, [yyyy, '-', mm, '-', dd])),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                onTap: _showDatePicker
              ),
              SizedBox(height: 20,),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(formatDate(
                      this._dateTime2, [yyyy, '-', mm, '-', dd,' ', HH, ':', nn, ':', ss])),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                onTap: _showDateTimePicker,
              ),

            ],
        ),
      ),
    );
  }
}