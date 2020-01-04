//泛型类
class PrintClass<T>{
  List list = new List<T>();
  void add(T value){
    this.list.add(value);
  }
  void printInfo(){
    for(var i=0; i<this.list.length; ++i){
      print(this.list[i]);
    }
  }
}



void main(){
  var p = new PrintClass();
  p.add("aaaa");
  p.add(2);
  p.printInfo();

  print('********************');
  var p1 = new PrintClass<int>();
  p1.add(1);
  p1.add(12);
  p1.printInfo();
  print('********************');
  var p2 = new PrintClass<String>();
  p2.add('xixi');
  p2.add('haha');
  p2.printInfo();
}