abstract class A{
  String name;
  printA();
}

abstract class B{
  printB();
}

class C implements A, B{
  @override
  printA() {
    print('print A');
  }

  @override
  printB() {
    print('print B');
  }

  @override
  String name;
  
}