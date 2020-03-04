main(List<String> args) {
  print("The main UI thread is starting on here");
  print("Now it will take 3 seconds to display the version of Dart.");
  checkVersion();
  print("The main UI thread ends");
}

Future<String> checkingVersion(){
  Future<String> delayingThreeSeconds = Future.delayed(Duration(seconds: 3), (){
    return "The version 2.7 is displayed here after 3 seconds";
  });
  return delayingThreeSeconds;
}

void checkVersion() async{
  String version = await checkingVersion();
  try{
    print("Display version here: $version");
  }
  catch(e){
    return e;
  }
}