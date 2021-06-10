import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../homeScreen/testresult.dart';
import '../homeScreen/vaccination.dart';
import '../utils/appBar.dart';
import '../utils/util.dart';


class MyFamilyHomeScreenPage extends StatefulWidget {
  final User selectedUser;

  MyFamilyHomeScreenPage({this.selectedUser});

  @override
  State<StatefulWidget> createState() => _MyFamilyHomeScreenPage();
}

class _MyFamilyHomeScreenPage extends State<MyFamilyHomeScreenPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: MyHeader(),
            elevation: 0,
            bottom: TabBar(
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                      width: 3.0, color: Theme.of(context).accentColor),
                  insets: const EdgeInsets.symmetric(horizontal: 60.0)),
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
}
