abstract class Animal{
  void eat(); //抽象方法
  void printInfo()
  {
    print('我是一个抽象类的方法');
  }
}

class Dog extends Animal{
  @override
  void eat() {
    print('Dog is eating');
  } 
}

class Cat extends Animal{
  @override
  void eat() {
    print('Cat is eating');
  }
}


void main()
{
  //多态
  Animal dog = new Dog();
  dog.eat();
  dog.printInfo();
  Animal cat = new Cat();
  cat.eat();
  cat.printInfo();
}