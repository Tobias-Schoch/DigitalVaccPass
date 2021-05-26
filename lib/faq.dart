import 'package:flutter/material.dart';
import 'appBar.dart';
import 'drawer.dart';

class MyFaqPage extends StatefulWidget {
  MyFaqPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyFaqPageState createState() => _MyFaqPageState();
}

class _MyFaqPageState extends State<MyFaqPage> {
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
            Text("FAQ View"),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
