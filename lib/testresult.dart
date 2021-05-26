import 'package:flutter/material.dart';
import 'appBar.dart';
import 'drawer.dart';

class MyTestPage extends StatefulWidget {
  MyTestPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyTestPageState createState() => _MyTestPageState();
}

class _MyTestPageState extends State<MyTestPage> {
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
            Text("Test View"),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
