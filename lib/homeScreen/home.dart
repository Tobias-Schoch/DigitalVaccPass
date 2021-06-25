import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../homeScreen/testresult.dart';
import '../homeScreen/vaccination.dart';
import '../utils/app_bar.dart';
import '../utils/drawer.dart';
import '../utils/user.dart';
import '../utils/util.dart';

/// Home screen to chose between vaccinations and tests
class MyHomeScreenPage extends StatefulWidget {
  /// Home screen to chose between vaccinations and tests
  MyHomeScreenPage({Key key, this.selectedTabIndex}) : super(key: key);

  /// Selected tab (vaccinations, tests)
  int selectedTabIndex = 0;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<int>('selectedTabIndex_home', selectedTabIndex));
  }

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
    selectTab(widget.selectedTabIndex);
    Util.checkFirstSeen(context);
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

  bool isDoctor = User.loggedInUser == null
      ? false
      : User.loggedInUser.userRole == Role.doctor
          ? true
          : false;

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
                text: AppLocalizations.of(context).vaccPass),
            Tab(
                icon: Icon(Icons.masks_outlined,
                    color: Theme.of(context).accentColor),
                text: AppLocalizations.of(context).testresults),
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isDoctor_home', isDoctor));
  }
}
