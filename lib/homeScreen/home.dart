import 'package:digital_vac_pass/homeScreen/testresult.dart';
import 'package:digital_vac_pass/homeScreen/vaccination.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appBar.dart';
import '../drawer.dart';

class MyHomeScreenPage extends StatefulWidget {

  MyHomeScreenPage({Key key, this.title, }) : super(key: key);

  final int title;

  @override
  State<StatefulWidget> createState() => _MyHomeScreenPage();

}

class _MyHomeScreenPage extends State<MyHomeScreenPage> with SingleTickerProviderStateMixin {
  int selectedTabIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2, initialIndex: selectedTabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: MyHeader(),
          elevation: 0,
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(icon: Icon(Icons.adb)),
              Tab(icon: Icon(Icons.accessible)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
          MyVaccinationPage(),
          MyTestPage(),
          ],
        ),
        drawer: MyDrawer(),
      );
  }
}