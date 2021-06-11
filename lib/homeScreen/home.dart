import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../homeScreen/testresult.dart';
import '../homeScreen/vaccination.dart';
import '../utils/app_bar.dart';
import '../utils/drawer.dart';
import '../utils/util.dart';

/// Home screen to chose between vaccinations and tests
class MyHomeScreenPage extends StatefulWidget {
  /// Home screen to chose between vaccinations and tests
  MyHomeScreenPage({Key key, this.selectedTabIndex}) : super(key: key);
  int selectedTabIndex = 0;

  @override
  State<StatefulWidget> createState() => _MyHomeScreenPage();
}

class _MyHomeScreenPage extends State<MyHomeScreenPage>
    with SingleTickerProviderStateMixin {
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

  bool isDoctor = User.loggedInUser.userRole == Role.doctor ? true : false;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const MyHeader(),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicator: UnderlineTabIndicator(
              borderSide:
                  BorderSide(width: 3, color: Theme.of(context).accentColor),
              insets: const EdgeInsets.symmetric(horizontal: 60)),
          tabs: [
            Tab(
                icon: Icon(Icons.local_hospital_outlined,
                    color: Theme.of(context).accentColor),
                text: 'Impfpass'),
            Tab(
                icon: Icon(Icons.masks_outlined,
                    color: Theme.of(context).accentColor),
                text: 'Testergebnisse'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          MyVaccinationPage(
              selectedUser: User.loggedInUser,
              isFloatingActionButtonVisible: true),
          MyTestPage(
              selectedUser: User.loggedInUser,
              isFloatingActionButtonVisible: true),
        ],
      ),
      drawer: MyDrawer(
        isVisible: isDoctor,
      ));
}
