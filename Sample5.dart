//循环语句
void main()
{
  var a = 1;
  print(++a);
  print(a);
  print(a++);
  print(a);

  print(--a);
  print(a);
  print(a--);
  print(a);

  for(int i = 0; i < 10; ++i){
    if(i.isEven){
      print(i);
    }
  }

  var ll = ['张三', '李四', '王五'];
  for (var item in ll) {
    print(item);
  } 

  for(int i = 0; i < ll.length; ++i){
    print(ll[i]);
  }
  
  var l2 = [
    {'title':'新闻111'},
    {'title':'新闻222'}
  ];

  for(var item in l2){
    print(item['title']);
  }

  int index = 1;
  while(index < 10){
    print(index);
    ++index;
  }

  do{
    print(index);
    ++index;
  }while(index < 20);

}