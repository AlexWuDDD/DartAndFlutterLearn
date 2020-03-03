class AboutLambdas{
  Function addingNumbers = (int a, int b){
    var sum = a + b;
    return sum;
  };

  Function multiplyWithEight = (int num){
    return num*8;
  };

  Function showName = (String name)=>name;

  int higherOrderFunction(Function myFunction){
    int a = 10;
    int b = 20;
    print(myFunction(a, b));
  }

  Function returnAFunction(){
    Function showAge = (int age)=>age;
    return showAge;
  }

  String anyString = "AnyParent String";
  Function overridingParentScope = (){
    String message = "Overriding the parent scope";
    print(message);
  };

  Function show = (){
    Function gettingImage(){
      String path = "This is a new path to iamge";
      print(path);
    };
    return gettingImage;
  };
}


main(List<String> args) {
  var add = AboutLambdas();
  var addition = add.addingNumbers(5, 10);
  print(addition);
  var mul = AboutLambdas();
  var result = mul.multiplyWithEight(4);
  print(result);
  var name = AboutLambdas();
  var myName = name.showName("Alex");
  print(myName);
  var higher = AboutLambdas();
  var higherOrder = higher.higherOrderFunction(add.addingNumbers);
  higherOrder;

  var showAge = AboutLambdas();
  var showingAge = showAge.returnAFunction();
  print(showingAge(25));

  var sayMessage = AboutLambdas();
  sayMessage.overridingParentScope();

  var image = AboutLambdas();
  String path  = "This is an old path.";
  var imagePath = image.show();
  imagePath();
}