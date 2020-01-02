//mininx
//不是接口 不是继承
//是一种全新的特性
/*
 * 1. 作为mixins的类只能继承来接Object, 不能继承其他类
 * 2. 作为mixins的类不能有构造函数
 * 
 *


 */

import 'Sample10_2.dart';

class Person{
  printInfo(){
    print('这是一个Person类');
  }
}

class A {
  String info = 'this is A';
  void printA(){
    print('A');
  }
}


class B{
  void printB(){
    print('B');
  }
}

class C extends Person with A,B{

} 

void main(){
  var c = new C();
  c.printA();
  c.printB();
  print(c.info);
  c.printInfo();
  print(c is A);
  print(c is B);
  print(c is C);

}