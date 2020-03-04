class CallableClassWithoutArgument{
  String output = "Callable class";
  void call(){
    print(output);
  }
}
class CallableClassWithArgument{
  call(String name) => "$name";
}

class Person{
  String name;
  String call(String message, [name]){
    return "This messageL '$message', has benn passed to the person $name.";
  }
}

main(List<String> args) {
  var withoutArgument = CallableClassWithoutArgument();
  var withArgument = CallableClassWithArgument();

  withoutArgument();
  print(withArgument("John Smith"));
  print(withArgument.call("Calling John smith"));

  var John = Person();
  John.name = "John Smith";
  String name = John.name;
  String msgAndName = John("Hi John how are you?", name);
  print(msgAndName);
}