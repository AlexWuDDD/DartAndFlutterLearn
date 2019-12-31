class Person{
  String name;
  int age;

  Person(this.name, this.age);

  Person.now()
  {
    print('我是命名构造函数');
  }

  Person.setInfo(String name, int age)
  {
    this.name = name;
    this.age = age;
  }

  void printInfo()
  {
    print("${this.name} -- ${this.age}");
  }
}

