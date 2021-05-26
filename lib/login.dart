import 'package:flutter/material.dart';
import 'appBar.dart';
import 'drawer.dart';

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyHeader(),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Login View"),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
