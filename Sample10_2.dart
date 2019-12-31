import 'Sample10_1.dart';

class Person{
  String name;
  num age;
  Person(this.name, this.age);
  void printInfo()
  {
    print("${this.name}--${this.age}");
  }
}

void main()
{
  Person p1;
  p1?.printInfo(); //?如果是空，就不运行
  Person p2 = new Person('张三', 20); 
  p2?.printInfo();

  if(p2 is Person){
    p2.name = '李四';
  }
  p2.printInfo();

  if(p2 is Object){
    print("true");
  }

  print("类型转换");
  var p3;
  p3 = '';
  p3 = new Person('王五', 30);
  (p3 as Person).printInfo();

  var p4 = new Person('赵六',32);
  p4.printInfo();
  p4.name = 'aaaa';
  p4.age = 222;
  p4.printInfo();

  p4..name = 'bbbb'
    ..age = 55
    ..printInfo();

}