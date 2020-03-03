class Cart{
  Function addTwoItems = (int item1, int item2){
    var sum = item1 + item2;
    return sum;
  };

  Function ourReturnPolicy = (String messageToCustomer){
    return messageToCustomer;
  };

  var returnUpdateCustomer = (String updateCustomer)=>updateCustomer;
}
Function DividingByFour(){
  Function LetUsDivide = (int x)=>x~/4;
  return LetUsDivide;
}

//Closure
//a closure can modify the parent scope
String message = "Any Parent String";
Function overridingParentScope = (){
  String message = "Overriding the parent scope";
  print(message);
};

Function show = (){
  Function gettingImage(){
    String path = "This is a new Path to image.";
    print(path);
  };
  return gettingImage();
};


main(List<String> args) {
  var cart = Cart();
  print("Your total price is:");
  print(cart.addTwoItems(120, 438));
  print(cart.ourReturnPolicy("Please read our return policy"));
  print(cart.returnUpdateCustomer("Your item has been shipped"));

  var result = DividingByFour();
  print(result(56));

  print("Closure");
  print(message);
  overridingParentScope();

  String path = "This is an old path";
  var showing = show;
  showing();
}