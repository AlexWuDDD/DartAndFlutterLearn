import 'package:flutter/material.dart';
import 'package:qrcodedemo/QrImage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QR Code Demo",
      home: QRCodeDemo(),
    );
  }
}

class QRCodeDemo extends StatelessWidget {
  const QRCodeDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QrImage(
          data: "沈佳仪 我爱你",
          size: 200,
        ),
      ),
    );
  }
}