import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:weather/page/page_container.dart';
import 'package:weather/styles.dart';
import 'package:weather/test.dart';
import 'package:weather/test2.dart';

void main(){
  //AppSettings settings = AppSettings();

  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
  //   .then((_) => runApp(
  //     MyApp(settings : settings),
  //   ));
  runApp(MyApp());
  // SystemChrome.setApplicationSwitcherDescription(
  //       const ApplicationSwitcherDescription(
  //           label: "Demo Flutter", primaryColor: 0xFFE53935))
  //   .then((_) {
  // runApp(new MyApp());
// });
}

class MyApp extends StatelessWidget {
  //final AppSettings settings;


  //const MyApp({Key key, this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = ThemeData(
      fontFamily: "Cabin",
      primaryColor: AppColor.midnightSky, //应用程序主要部分的背景颜色
      accentColor: AppColor.midnightCloud, //小部件的前景色
      //A text theme that contrasts with the primary color.
      primaryTextTheme: Theme.of(context).textTheme.apply(
        bodyColor: AppColor.cloudColorLight,
        displayColor: AppColor.textColorDark,
      ),
      //Text with a color that contrasts with the card and canvas colors.
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: AppColor.textColorDark,
        displayColor: AppColor.textColorDark,
      ),
    );

    return PhysicalAnimationDemo();

    // return MaterialApp(
    //   title: 'Weather App',
    //   debugShowCheckedModeBanner: false,
    //   theme: theme,
    //   //home: PageContainer(settings:settings),
    //   home: Test2(),
    // );
  }
}