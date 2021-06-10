import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io/socket_io.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'aboutScreen/streamsocket.dart';
import 'loginScreen/login.dart';
import 'utils/util.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0x00fafafa),
  ));
}

class MyApp extends StatelessWidget {
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
        fontFamily: "Inter",
        primaryColor: PredefinedColors.accentWhite,
        accentColor: PredefinedColors.primaryColor,
        primaryColorLight: PredefinedColors.textColor,
        textButtonTheme: TextButtonThemeData(),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 10,
        ),
        snackBarTheme: SnackBarThemeData(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: PredefinedColors.primaryColor,
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
              fontWeight: FontWeight.w700,
              fontSize: 35,
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

void connectAndListen() {
  IO.Socket socket = IO.io('http://localhost:3000',
      OptionBuilder().setTransports(['websocket']).build());

  socket.onConnect((_) {
    print('connect');
    socket.emit('msg', 'test');
  });

  //When an event recieved from server, data is added to the stream
  socket.on('event', (data) => streamSocket.addResponse);
  socket.onDisconnect((_) => print('disconnect'));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyLoginPage(),
    );
  }
}
