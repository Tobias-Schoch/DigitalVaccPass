import 'package:flutter/material.dart';
import 'appBar.dart';
import 'drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const textColor = const Color(0xff263238);
    const backgroundColor = const Color(0xfffafafa);
    return MaterialApp(
      title: 'Impfpass',
      theme: ThemeData(
          fontFamily: "Inter",
          primaryColor: backgroundColor,
          textTheme: TextTheme(
            headline1: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 40, color: textColor),
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
      appBar: AppBar(
        title: MyHeader(),
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Impfungen",
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.left),
            SizedBox(height: 25),
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 10,
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    SizedBox(height: 18),
                    Text("Covid-19 Biontech",
                        style: Theme.of(context).textTheme.bodyText1),
                  ]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text("ChargeNr.: 123845234", textAlign: TextAlign.left),
                      SizedBox(height: 2),
                      Text("Datum: 08.05.2021", textAlign: TextAlign.left),
                      SizedBox(height: 2),
                      Text("Arzt: Dr. Peter Schmidt",
                          textAlign: TextAlign.left),
                      SizedBox(height: 18),
                    ],
                  ))
            ])),
            SizedBox(height: 20),
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              elevation: 10,
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 18),
                        Text("Tetanus",
                            style: Theme.of(context).textTheme.bodyText1),
                      ]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text("ChargeNr.: 123845234", textAlign: TextAlign.left),
                      SizedBox(height: 2),
                      Text("Datum: 08.05.2021", textAlign: TextAlign.left),
                      SizedBox(height: 2),
                      Text("Arzt: Dr. Peter Schmidt",
                          textAlign: TextAlign.left),
                      SizedBox(height: 18),
                    ],
                  ))
            ])),
            SizedBox(height: 20),
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 10,
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    SizedBox(height: 18),
                    Text("Diptherie",
                        style: Theme.of(context).textTheme.bodyText1),
                  ]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text("ChargeNr.: 123845234", textAlign: TextAlign.left),
                      SizedBox(height: 2),
                      Text("Datum: 08.05.2021", textAlign: TextAlign.left),
                      SizedBox(height: 2),
                      Text("Arzt: Dr. Peter Schmidt",
                          textAlign: TextAlign.left),
                      SizedBox(height: 18),
                    ],
                  ))
            ])),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
