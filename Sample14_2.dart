//async and await
//这两个关键字的使用只需要记住两点
//只有async方法才能使用await关键字调用方法
//如果调用别的async方法必须使用await关键字

//async是让方法变异步
//await是等待异步方法执行完成

import 'dart:io';

void main() async{
  var result = await testAsync();
  print(result);
  
}

testAsync() async{
  return 'Hello async';
}