import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAnimation1(),
    );
  }
}

class MyAnimation1 extends StatefulWidget{
  MyAnimation1({Key key}) : super(key: key);

  @override
  _MyAnimation1State createState() => _MyAnimation1State();
}

class _MyAnimation1State extends State<MyAnimation1> with TickerProviderStateMixin{
  
  Animation<double> animation; //动画对象
  AnimationController animationController;
  
  @override
  void initState() { 
    super.initState();
    //创建AnimationController 用于控制动画
    //必须提供动画时间
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    //创建一个插件值，关联AnimationController, 返回一个新的Animation对象
    animation = Tween<double>(begin:10.0, end:100.0).animate(animationController);

    animation.addListener((){
      //当动画更新时会调用
      //需要在这个函数中，调用setState()来触发视图刷新
      setState(() {
        
      });
    });

    animation.addStatusListener((s){
      print('$s');
    });

    //开始播放动画
    animationController.addStatusListener((s){
      if(s == AnimationStatus.completed){
        animationController.reverse();
      }
      if(s == AnimationStatus.dismissed){
        animationController.forward();
      }
    });

    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anim Demo"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SizedBox(
          //获取插件器计算出的value
          //作为属性值
          width: animation.value,
          height: animation.value,
          child: Container(
            color: Colors.lightBlue,
          ),
        ),
      ),
    );
  }
}