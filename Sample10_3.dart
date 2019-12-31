class Person{
  String name;
  num age;
  Person(this.name, this.age);
  Person.xxx(this.name, this.age);
  void printInfo()
  {
    print("${this.name} -- ${this.age}");
  }

}

class Web extends Person{
  String sex;
  Web(String name, num age, String sex) : super.xxx(name, age)
  {
    this.sex = sex;
  }

  void run()
  {
    print("${this.name} -- ${this.age} -- ${this.sex}");
  }
  
  @override
  void printInfo(){
    super.printInfo();
    run();
  }
}

void main()
{
  Web w = new Web('aaaa', 22, '男');
  w.printInfo();
  w.run();
}