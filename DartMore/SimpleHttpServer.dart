
import 'dart:io';

final File MyFile = File("index.html");

Future main() async{
  var myServer = await HttpServer.bind('127.0.0.1', 8080);
  print("The server is alive on the above mentioned port and it's listening on ${myServer.port}");

  await for(HttpRequest myRequest in myServer){
    if(await MyFile.exists()){
      print("We are going to serve ${MyFile.path}");
      myRequest.response.headers.contentType = ContentType.html;
      await MyFile.openRead().pipe(myRequest.response);
    }
  }
}