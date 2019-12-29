void printInfo()
{
  print('我是一个自定义方法');
}

String printUserInfo()
{
  return 'str';
}

List getList()
{
  return ['111','222', '333'];
}

int sumNum(int n)
{
  int sum = (1 + n) * n~/2;
  return sum;
}

String printUserInfo2(String username, int age)
{
  return "姓名: $username --- 年龄: $age";
}

//可选参数
String printUserInfo3(String username, 
  [int age])
{
  if(age != null){
    return "姓名: $username --- 年龄: $age";
  }
  else{
    return "姓名: $username --- 年龄: 保密";
  }
}

String printUserInfo4(String username, 
  [String sex='男', int age])
{
  if(age != null){
    return "姓名: $username --性别: $sex- 年龄: $age";
  }
  else{
    return "姓名: $username --性别: $sex- 年龄: 保密";
  }
}

//命名参数
String getUserInfo(String username, {int age, String sex = '男'})
{
  if(age != null){
    return "姓名: $username --性别: $sex- 年龄: $age";
  }
  else{
    return "姓名: $username --性别: $sex- 年龄: 保密";
  }  
}

//把方法当做参数
fn1()
{
  print('fn1');
}

fn2(fnname)
{
  fnname();
}



void main()
{
  print('函数');
  printInfo();

  int getNum()
  {
    var myNum = 123;
    return myNum;
  }

  var n = getNum();
  print(n);

  var str = printUserInfo();
  print(str);
  print(getList());

  print(sumNum(5));

  print(printUserInfo2("Alex", 28));
  print(printUserInfo3('Amy'));
  print(printUserInfo4('amy', '女'));

  print(getUserInfo('张三', age:20));

  fn2(fn1);

  var fn=(){
    print('我是一个匿名方法');
  };
  
  fn();
}