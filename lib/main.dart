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
    return MaterialApp(
      title: 'Impfpass',
      theme: ThemeData(
          fontFamily: "Inter",
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            headline5: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            headline6: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            bodyText1: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            bodyText2: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Impfpass"),
            Card(
                margin: EdgeInsets.all(20),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                      title: Column(
                        children: [
                          SizedBox(height: 18),
                          Text("Covid-19 Biontech", style: Theme.of(context).textTheme.bodyText1),
                        ]
                      ),

                      subtitle: Column(
                        children: [
                          SizedBox(height: 10),
                          Text("ChargeNr.: 123845234",
                              textAlign: TextAlign.left),
                          SizedBox(height: 2),
                          Text("Datum: 08.05.2021", textAlign: TextAlign.left),
                          SizedBox(height: 2),
                          Text("Arzt: Dr. Peter Schmidt",
                              textAlign: TextAlign.left),
                          SizedBox(height: 18),
                        ],
                      ))
                ])),
            Card(
                margin: EdgeInsets.all(20),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                      title: Column(
                          children: [
                            SizedBox(height: 18),
                            Text("Tetanus", style: Theme.of(context).textTheme.bodyText1),
                          ]
                      ),
                      subtitle: Column(
                        children: [
                          SizedBox(height: 10),
                          Text("ChargeNr.: 123845234",
                              textAlign: TextAlign.left),
                          SizedBox(height: 2),
                          Text("Datum: 08.05.2021", textAlign: TextAlign.left),
                          SizedBox(height: 2),
                          Text("Arzt: Dr. Peter Schmidt",
                              textAlign: TextAlign.left),
                          SizedBox(height: 18),
                        ],
                      ))
                ])),
            Card(
                margin: EdgeInsets.all(20),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                      title: Column(
                          children: [
                            SizedBox(height: 18),
                            Text("Diptherie", style: Theme.of(context).textTheme.bodyText1),
                          ]
                      ),
                      subtitle: Column(
                        children: [
                          SizedBox(height: 10),
                          Text("ChargeNr.: 123845234",
                              textAlign: TextAlign.left),
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
