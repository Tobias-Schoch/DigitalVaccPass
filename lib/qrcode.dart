import 'package:flutter/material.dart';
import 'appBar.dart';
import 'drawer.dart';

class MyQRPage extends StatefulWidget {
  MyQRPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyQRPageState createState() => _MyQRPageState();
}

class _MyQRPageState extends State<MyQRPage> {
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
            Text("QR CODE View"),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
