import 'Sample7.dart';

void main()
{
  List list = ['aaa', 'bbb', 'ccc'];

  list.forEach((value){
    print(value);
  });

  print('');

  list.forEach((value)=>print(value));

  List l1 = [1,2,3,4,5,6];
  var l2 = l1.map((value){
    if(value > 2){
      return value*2;
    }
    return value;
  }).toList();
  print(l2);

  var l3 = l1.map((value)=>value>2?value*2:value).toList();
  print(l3);

  bool isEvenNumber(int n){
    if(n%2==0){
      return true;
    }
    else{
      return false;
    }
  }

  print(isEvenNumber(20));

  void printNum(n){
    for(var i = 1; i<=n; ++i){
      if(isEvenNumber(i)){
        print(i);
      }
    }
  }

  printNum(10);

  var printNum2=(int n){
    print(n+2);
  };

  printNum2(2);

  print('自执行方法');
  ((int n){
    print('我是自执行方法');
    print(n);
  })(12);

  print('方法的递归');
  var sum=1;
  fn(n){
    sum*=n;
    if(n==1){
      return;
    }
    fn(n-1);
  }
  fn(5);
  print(sum);

  print('通过方法的递归求1-100的和');
  int fn2(int n){
    if(n==1){
      return n;
    }
    return n+fn2(n-1);
  }
  print(fn2(100));

  print('闭包');
  //1.全局变量特点：全局变量常驻内存，污染全局
  //2.局部变量特点：局部变量不常住内存，会被垃圾机制回收，不会污染全局
  //想实现的功能：
  //1.常驻内存
  //2.不污染全局
  //闭包：函数嵌套函数，内部函数会调用外部函数的变量或参数
  //变量或参数不会被系统回收

  printInfo(){
    var a = 123;
    ++a;
    print(a);
  }

  printInfo();

  fnClosePackage(){
    var a = 123;
    return(){
      a++;
      print(a);
    };
  }
  var b = fnClosePackage();
  b();
  b();
  b();




}