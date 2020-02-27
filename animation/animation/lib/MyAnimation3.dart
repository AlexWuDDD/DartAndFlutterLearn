import 'package:flutter/material.dart';

class AnimatedImage extends AnimatedWidget{

  AnimatedImage({Key key, Animation<double> animation})
    : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    // TODO: implement build
    return Center(
      child: SizedBox(
        width: animation.value,
        height: animation.value,
        child: Container(
          color: Colors.lightBlue,
        ),
      ),
    );
  }
}

class MyAnimation3 extends StatefulWidget {
  MyAnimation3({Key key}) : super(key: key);

  @override
  _MyAnimation3State createState() => _MyAnimation3State();
}

class _MyAnimation3State extends State<MyAnimation3> with SingleTickerProviderStateMixin{
  
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween(begin: 0.0, end:300.0).animate(controller);

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
        title: Text("Animation Wedget Demo"),
      ),
      body: AnimatedImage(animation: this.animation,),
    ); 

  }
}