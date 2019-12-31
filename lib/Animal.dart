class Animal{
  String _name; //加‘_’变私有
  int age;

  Animal(this._name, this.age);
  void printInfo()
  {
    print("${this._name} -- ${this.age}");
  }

  String getName()
  {
    return this._name;
  }

  void _run()
  {
    print('这是一个私有方法');
  }

  void exec_run()
  {
    this._run();
  }
}