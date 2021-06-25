import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../homeScreen/testresult.dart';
import '../homeScreen/vaccination.dart';
import '../utils/app_bar.dart';
import '../utils/user.dart';

/// Single family
class MyFamilyHomeScreenPage extends StatefulWidget {
  /// Single family
  const MyFamilyHomeScreenPage({Key key, this.selectedUser}) : super(key: key);

  /// selected family member
  final User selectedUser;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<User>('absorbing', selectedUser));
  }

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
                  text: AppLocalizations.of(context).vaccPass),
              Tab(
                  icon: Icon(Icons.masks_outlined,
                      color: Theme.of(context).accentColor),
                  text: AppLocalizations.of(context).testresults),
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
