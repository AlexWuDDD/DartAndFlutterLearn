

void main(List<String> args) {
  var num1 = 1;
  print(num1++);
  print(++num1);

  var num2;
  print(num2??=10);

  var myProducts = {
    1: "TV",
    2: "Tablet",
  };

  List list = [1,2,3,4,5];
  Set mySet = {1,2,3};

  myProducts.forEach((x, y) => print("${x} : ${y}"));
  print("***************");
  list.forEach((i)=>print(i));
  print("***************");
  mySet.forEach((s)=>print(s));
}