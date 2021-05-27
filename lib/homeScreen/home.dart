import 'package:digital_vac_pass/homeScreen/testresult.dart';
import 'package:digital_vac_pass/homeScreen/vaccination.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appBar.dart';
import '../drawer.dart';

class MyHomeScreenPage extends StatefulWidget {

  MyHomeScreenPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _MyHomeScreenPage();

}

class _MyHomeScreenPage extends State<MyHomeScreenPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child:  Scaffold(
        appBar: AppBar(
          title: MyHeader(),
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.adb)),
              Tab(icon: Icon(Icons.accessible)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
          MyVaccinationPage(),
          MyTestPage(),
          ],
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}