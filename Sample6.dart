void main(){
  print("list");
  List myList = ['香蕉', '苹果', '西瓜'];
  print(myList);
  print(myList.length);
  print(myList.isEmpty);
  print(myList.isNotEmpty);
  print(myList.reversed);

  var newMyList = myList.reversed.toList();
  print(newMyList);

  myList.add('桃子');
  print(myList);
  myList.addAll(['葡萄', '生梨']);
  print(myList);
  print(myList.indexOf('葡萄'));//找到返回index
  print(myList.indexOf('哈密瓜'));//找不到返回-1
  myList.remove('西瓜');
  print(myList);
  myList.removeAt(2);
  print(myList);  

  myList.fillRange(1, 2, 'aaa');
  print(myList);

  myList.insert(1, 'bbbb');
  print(myList);
  myList.insertAll(2, ['cccc', 'ddddd']);
  print(myList);

  print(myList.join('-')); //list to String

  var str = 'aaaa-bbbb-cccc';
  var l1 = str.split('-');
  print(l1);
  print(l1 is List);

  print('Set');
  var s = new Set(); //去重
  s.add('aaaa');
  s.add('bbbb');
  print(s);
  s.add('aaaa');
  print(s);
  print(s.toList());

  List l2 = ['aaa', 'bbb', 'aaa', 'bbb'];
  l2 = l2.toSet().toList();
  print(l2);

  print('Map');
  var person = {
    'name':'张三',
    'age':20
  };

  print(person);
  print(person.keys.toList());
  print(person.values.toList());
  print(person.isEmpty);
  print(person.isNotEmpty);

  person.addAll({
    'work':['敲代码', '送外卖'],
    'height': 160
  });
  print(person);
  person.remove('height');
  print(person);
  print(person.containsValue('张三'));

  print('常用循环方法');
  List l3 = ['aaaa', 'bbbb', 'cccc'];
  for(var item in l3){
    item += 'pppp';
    print(item);
  }

  l3.forEach((value){
    print("$value");
  });

  List l4 = l3.map((value){
    return value + 'LOL';
  }).toList();
  print(l4);

  List l5 = [1,2,3,4,5,6,7,8,9];
  var l6 = l5.where((value){
    return value>5;
  }).toList();
  print(l6);

  List l7 = [1,2,3,4,5,6,7,8,9];
  var f = l7.any((value){ //只要集合由满足条件的就返回true
    return value > 5;
  });
  print(f);

  List l8 = [1,2,3,4,5,6,7,8,9];
  var f2 = l7.every((value){ //每一个都满足条件的就返回true，否则返回false
    return value > 5;
  });
  print(f2);

  //set 和 map是一样的

}