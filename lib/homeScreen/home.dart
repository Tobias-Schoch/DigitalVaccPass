import 'package:digital_vac_pass/homeScreen/testresult.dart';
import 'package:digital_vac_pass/homeScreen/vaccination.dart';
import 'package:digital_vac_pass/util.dart';
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
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0, color: PredefinedColors.primaryColor),
                insets: EdgeInsets.symmetric(horizontal:70.0)
            ),
            tabs: [
              Tab(icon: Icon(Icons.adb), text: "Impfpass"),
              Tab(icon: Icon(Icons.accessible), text: "Covid-19 Test"),
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