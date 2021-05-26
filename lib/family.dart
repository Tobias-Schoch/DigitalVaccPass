import 'package:flutter/material.dart';
import 'appBar.dart';
import 'drawer.dart';

class MyFamilyPage extends StatefulWidget {
  MyFamilyPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyFamilyPageState createState() => _MyFamilyPageState();
}

class _MyFamilyPageState extends State<MyFamilyPage> {
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
            Text("Family View"),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
