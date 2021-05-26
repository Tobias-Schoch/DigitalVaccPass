import 'package:flutter/material.dart';
import 'appBar.dart';
import 'drawer.dart';

class MyRegisterPage extends StatefulWidget {
  MyRegisterPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
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
            Text("Register View"),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
