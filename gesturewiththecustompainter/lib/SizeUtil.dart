import 'dart:math';

import 'package:flutter/material.dart';

class SizeUtil{
  static const _DESIGN_WIDTH = 500;
  static const _DESIGN_HEIGHT = 500;

  //logic size indevice
  static Size _logicSize = Size(100, 100);

  //device pixel radio

  static get width {
    return _logicSize.width;
  }

  static get height{
    return _logicSize.height;
  }

  static set size(size){
    _logicSize = size;
  }

  //可以输入原图的位置，然后转换成现有的设备对应的尺寸
  static double getAxisX(double w){
    return (w * width) / _DESIGN_WIDTH;
  }

  static double getAxisY(double h){
    return (h * height) / _DESIGN_HEIGHT;
  }

  static double getAxisBoth(double s){
    return s * sqrt((width*width + height*height)/(_DESIGN_WIDTH * _DESIGN_WIDTH + _DESIGN_HEIGHT * _DESIGN_HEIGHT));
  }
}