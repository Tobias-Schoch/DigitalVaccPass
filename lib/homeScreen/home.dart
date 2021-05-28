import 'package:digital_vac_pass/homeScreen/testresult.dart';
import 'package:digital_vac_pass/homeScreen/vaccination.dart';
import 'package:digital_vac_pass/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appBar.dart';
import '../drawer.dart';

class MyHomeScreenPage extends StatefulWidget {

  int selectedTabIndex = 0;
  final int title;

  MyHomeScreenPage({this.title, this.selectedTabIndex});

  @override
  State<StatefulWidget> createState() => _MyHomeScreenPage();

}

class _MyHomeScreenPage extends State<MyHomeScreenPage> with SingleTickerProviderStateMixin {
  int _selectedTabIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    selectTab(widget.selectedTabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void selectTab(int index) {
    _selectedTabIndex = index;
    _tabController.animateTo(_selectedTabIndex);
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
                borderSide: BorderSide(width: 3.0, color: Theme.of(context).accentColor),
                insets: EdgeInsets.symmetric(horizontal:60.0)
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
        drawer: MyDrawer(isVisible: User.loggedInUser.userRole == Role.Doctor ? true : false),
      );
  }
}