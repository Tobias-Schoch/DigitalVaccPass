import 'package:flutter/material.dart';
import 'appBar.dart';
import 'drawer.dart';

class MyForgotPasswordPage extends StatefulWidget {
  MyForgotPasswordPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyForgotPasswordPageState createState() => _MyForgotPasswordPageState();
}

class _MyForgotPasswordPageState extends State<MyForgotPasswordPage> {
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
            Text("Forgot Password View"),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
