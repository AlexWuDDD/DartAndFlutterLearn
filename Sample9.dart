import 'lib/Person.dart';
import 'lib/Animal.dart';
import 'lib/Rect.dart';

void main()
{
  //实例化
  var p1 = new Person('张三', 20);
  p1.printInfo();

  Person p2 = new Person('李四',25);
  p2.printInfo();

  var p3 = new Person.now();

  var p4 = new Person.setInfo('李四', 30);
  p4.printInfo();

  Animal a = new Animal('小狗', 3);
  a.printInfo();
  
  a.exec_run();

  //Rect r = new Rect(10.5, 2);
  Rect r= new Rect();
  //print('面积: ${r.area()}');
  print('面积: ${r.area}');

  r.areaheight = 19.33;
  print('面积: ${r.area}');
}