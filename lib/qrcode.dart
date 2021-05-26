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
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Mein QR-Code",
              style: Theme.of(context).textTheme.headline4,
            ),
            Image.asset('images/qr.png'),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
