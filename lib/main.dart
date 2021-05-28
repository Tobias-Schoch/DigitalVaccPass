import 'package:digital_vac_pass/utils/util.dart';
import 'package:flutter/material.dart';
import 'loginScreen/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Impfpass',
      theme: ThemeData(
        fontFamily: "Inter",

        primaryColor: PredefinedColors.accentWhite,
        accentColor: PredefinedColors.primaryColor,
        primaryColorLight: PredefinedColors.textColor,

        textButtonTheme: TextButtonThemeData(
        ),

        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 10,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 16, fontFamily: "Inter"),
            primary: PredefinedColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
          ),
        ),

        textTheme: TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 40,
              color: PredefinedColors.textColor),
          headline4: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
              color: PredefinedColors.textColor),
          headline5: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: PredefinedColors.textColor),
          headline6: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: PredefinedColors.textColor),
          bodyText1: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: PredefinedColors.textColor),
          bodyText2: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: PredefinedColors.textColor),
        ),
        hoverColor: Colors.transparent,
      ),
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
