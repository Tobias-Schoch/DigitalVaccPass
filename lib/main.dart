import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'utils/util.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: const Color(0x00fafafa),
  ));
  runApp(const MyApp());
}

/// Main startpoint
class MyApp extends StatelessWidget {
  /// Main startpoint
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('en'), const Locale('de')],
      title: 'Impfpass',
      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: PredefinedColors.accentWhite,
        accentColor: PredefinedColors.primaryColor,
        primaryColorLight: PredefinedColors.textColor,
        textButtonTheme: const TextButtonThemeData(),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 10,
        ),
        snackBarTheme: SnackBarThemeData(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: PredefinedColors.primaryColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 16, fontFamily: 'Inter'),
            primary: PredefinedColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
          ),
        ),
        textTheme: const TextTheme(
          headline1: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 35,
              color: PredefinedColors.textColor),
          headline3: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: PredefinedColors.textColor),
          headline4: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
              color: PredefinedColors.textColor),
          headline5: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: PredefinedColors.textColor),
          headline6: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: PredefinedColors.textColor),
          bodyText1: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: PredefinedColors.textColor),
          bodyText2: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: PredefinedColors.textColor),
        ),
        hoverColor: Colors.transparent,
      ),
      home: const MyHomePage(title: 'Impfpass'),
    );
  }
}

/// set startpoint for app
class MyHomePage extends StatefulWidget {
  /// set startpoint for app
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      const Scaffold();
}
