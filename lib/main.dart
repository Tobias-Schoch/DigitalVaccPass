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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.title),
            Card(
                margin: EdgeInsets.all(20),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                      title: Text(
                        "Covid-19 Biontech",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      subtitle: Column(
                        children: [
                          Text("ChargeNr.: 123845234",
                              textAlign: TextAlign.left),
                          Text("Datum: 08.05.2021", textAlign: TextAlign.left),
                          Text("Arzt: Dr. Peter Schmidt",
                              textAlign: TextAlign.left),
                        ],
                      ))
                ])),
            Card(
                margin: EdgeInsets.all(20),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                      title: Text(
                        "Tetanus",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      subtitle: Column(
                        children: [
                          Text("ChargeNr.: 123845234",
                              textAlign: TextAlign.left),
                          Text("Datum: 08.05.2021", textAlign: TextAlign.left),
                          Text("Arzt: Dr. Peter Schmidt",
                              textAlign: TextAlign.left),
                        ],
                      ))
                ])),
            Card(
                margin: EdgeInsets.all(20),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                      title: Text(
                        "Diptherie",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      subtitle: Column(
                        children: [
                          Text("ChargeNr.: 123845234",
                              textAlign: TextAlign.left),
                          Text("Datum: 08.05.2021", textAlign: TextAlign.left),
                          Text("Arzt: Dr. Peter Schmidt",
                              textAlign: TextAlign.left),
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
