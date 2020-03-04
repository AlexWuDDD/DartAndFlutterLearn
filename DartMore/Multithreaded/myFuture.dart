main(List<String> args) {
  print("The main UI thread ois starting on here");
  print("Now it will take 10 seconds yp display new headlines");
  displayNews();
  print("The main UI ends");  
}

Future<String> checkingNewsApp(){
  Future<String> delayingTenSeconds = Future.delayed(Duration(seconds: 10), (){
    return "The last headlines are displayed here after 10 seconds";
  });
  return delayingTenSeconds;
}

// void displayNews(){
//   Future<String> displayingNewsHeadlines = checkingNewsApp();
//   displayingNewsHeadlines.then((displayString){
//     print("Displaying news headlines here: $displayString");
//   });
// }

void displayNews() async{
  String displayString= await checkingNewsApp();
  print("Displaying news headlines here: $displayString");
}