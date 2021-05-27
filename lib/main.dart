import 'package:flutter/material.dart';
import 'loginScreen/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const textColor = const Color(0xff263238);
    const backgroundColor = const Color(0xfffafafa);
    const primeColor = const Color(0xff5D5FEF);
    return MaterialApp(
      title: 'Impfpass',
      theme: ThemeData(
          fontFamily: "Inter",
          primaryColor: backgroundColor,
          accentColor: primeColor,
          textTheme: TextTheme(
            headline1: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 40, color: textColor),
            headline4: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 30, color: textColor),
            headline5: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 20, color: textColor),
            headline6: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 15, color: textColor),
            bodyText1: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 24, color: textColor),
            bodyText2: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 16, color: textColor),
          )),
      home: MyHomePage(title: 'Impfpass'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyLoginPage(),
    );
  }
}
