//数据类型 
// int, double, String, bool, List, Maps

import 'dart:collection';

void main(){
  String str1 = 'this is str1';
  String str2 = "this is str2";
  String str3 = '''
  this is str3
  this is str3
  this is str3
  ''';

  String str4 = """
  this is str4
  this is str4
  this is str4
  """;

  print(str1);
  print(str2);
  print(str3);
  print(str4);

  print(str1 + " " + str2);

  int a = 123;
  double b = 23.555;
  double c = 24;
  print(a);
  print(b);
  print(c);

  bool flag1 = true;
  bool flag2 = false;
  print(flag1);
  print(flag2);

  var flag = true;
  if(flag){
    print('真');
  }
  else{
    print('假');
  }

  var m = 123;
  var n = 235;
  if(m == n){
    print("equal");
  }
  else{
    print('not euqal');
  }

  var ll = ['aaa','bbb', 'cccc'];
  print(ll);
  print(ll.length);
  print(ll[2]);

  var l2 = new List();
  l2.add('zhang 3');
  l2.add('li 4');
  l2.add('wang 5');

  print(l2);
  print(l2[2]);

  var l3 = new List<String>();
  l3.add('aaa11');
  //l3.add(123);


  //maps
  var person = {
    'name':'zhang 3',
    'age': 20
    };

  print(person);
  print(person['name']);

  var person2 = new Map();
  person2['name'] = '李四';
  person2['age'] = 22;
  print(person2);

  var str11 = '1234';
  if( str1 is String){
    print('是String类型');
  }
  else if (str11 is int){
    print('是int类型');
  }
  else{
    print('其他类型');
  }

  









}