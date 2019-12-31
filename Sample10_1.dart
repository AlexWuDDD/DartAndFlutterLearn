class Person{
  static String name = '张三';
  int age = 20;
  static void show()
  {
    print(name);
  }

  /*非静态方法可以访问静态成员以及非静态成员*/
  void printInfo()
  {
    print(name); 
    print(this.age);
    show();
  }
}

void main()
{
  print(Person.name);
  Person.show();

  var p1 = new Person();
  p1.printInfo();
}
