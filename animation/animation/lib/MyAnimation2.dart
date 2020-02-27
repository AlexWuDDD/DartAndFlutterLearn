import 'dart:ffi';

import 'package:flutter/material.dart';

class MyAnimation2 extends StatefulWidget {
  MyAnimation2({Key key}) : super(key: key);

  @override
  _MyAnimation2State createState() => _MyAnimation2State();
}

class _MyAnimation2State extends State<MyAnimation2>  with TickerProviderStateMixin{

  //创建AnimationController
  AnimationController controller;
  Animation<double> anim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      );
    //非线性插值器
    anim = CurvedAnimation(
      parent: controller, 
      curve: Curves.decelerate,
      reverseCurve: Curves.decelerate,
    );

    anim.addListener((){
      setState(() {
        
      });
    });

    anim.addStatusListener((s){
      print("${s}");
    });

    controller.addStatusListener((s){
      if(s == AnimationStatus.completed){
        controller.reverse();
      }
      if(s == AnimationStatus.dismissed){
        controller.forward();
      }
    });

    controller.forward();  
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anim Curve Demo'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SizedBox(
          height: anim.value*100, 
          width: anim.value*100,
          child: Container(
            color: Colors.redAccent,
          ),),
      ),
    );
  }
}