//泛型
T getData<T>(T value){
  return value;
}


void main(){
  var ret1 = getData<int>(21);
  if(ret1 is int){
    print(true);
  }

  var ret2 = getData<String>('hello');
  print(ret2);
}