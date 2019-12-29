void main(){

  print('算术运算符');
  int a = 13;
  int b = 5;
  print(a+b);
  print(a-b);
  print(a*b);
  print(a/b);
  print(a%b);
  print(a~/b); //取整

  var c = a*b;
  print(c);

  print('关系运算符');
  print(a==b);
  print(a!=b);
  print(a>b);
  print(a<b);
  print(a>=b);
  print(a<=b);

  print('逻辑运算符');
  bool flag = true;
  print(!flag);
  print(flag&&false);
  print(flag||false);

  print("赋值运算符");
  //??= 如果e是空则赋值23，否则不赋值
  int e;
  e??=23;
  print(e);
  int d = 19;
  d??=89;
  print(d);

  print("复合赋值运算符");
  //+=, -=,  *=,  /=,  %=,  ~/= 

  print("条件表达式");
  bool f = true;
  if(f){
    print("true");
  }
  else{
    print("false");
  }

  int score = 90;
  if(score >= 90){
    print("优");
  }
  else if(score >= 80){
    print("良");
  }
  else{
    print("及格");
  }

  var sex = '男';
  switch(sex){
    case '男':
      print("男的");break;
    case '女':
      print("女的");break;
    default:
      print("人妖？");break;    
  }

  var kkk = 90>80?'handsome':'ugly';
  print(kkk);

  print("类型转换");
  String str = '123';
  var num = int.parse(str);
  print(num is int);

  String str1 = '123.1';
  var num1 = double.parse(str1);
  print(num1 is double);

  //报错
  String price = "";
  try{
    var num2 = int.parse(price);
    print(num2);
    print(num2 is int);
  }
  catch(err){
    print(err.toString());
  }

  var num3 = 123;
  var str3 = num3.toString();
  print(str3 is String);

  var str4 = 'xxxxx';
  print(str4.isEmpty);

  var mynum = 123;
  if(mynum == 0){
    print('0');
  }
  else{
    print('非0');
  }

  var mynum2;
  print(mynum2==null);

  var mynum3 = 0/0;
  if(mynum3.isNaN){
    print("NaN");
  }

  print("test done");

}