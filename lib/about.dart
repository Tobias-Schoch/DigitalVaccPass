import 'package:flutter/material.dart';
import 'appBar.dart';
import 'drawer.dart';

class MyAboutPage extends StatefulWidget {
  MyAboutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAboutPageState createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
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
            Text("About View"),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
