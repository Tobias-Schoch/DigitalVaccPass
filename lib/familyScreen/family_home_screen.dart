import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../homeScreen/testresult.dart';
import '../homeScreen/vaccination.dart';
import '../utils/app_bar.dart';
import '../utils/util.dart';

/// Single family
class MyFamilyHomeScreenPage extends StatefulWidget {
  /// Single family
  const MyFamilyHomeScreenPage({Key key, this.selectedUser}) : super(key: key);
  final User selectedUser;

  @override
  State<StatefulWidget> createState() => _MyFamilyHomeScreenPage();
}

class _MyFamilyHomeScreenPage extends State<MyFamilyHomeScreenPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const MyHeader(),
          elevation: 0,
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                    width: 3, color: Theme.of(context).accentColor),
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
          children: <Widget>[
            MyVaccinationPage(
                selectedUser: widget.selectedUser,
                isFloatingActionButtonVisible: false),
            MyTestPage(
                selectedUser: widget.selectedUser,
                isFloatingActionButtonVisible: false),
          ],
        ),
      ));
}
