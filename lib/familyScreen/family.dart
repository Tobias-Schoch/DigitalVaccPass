import 'package:digital_vac_pass/utils/user.dart';
import 'package:flutter/material.dart';

import '../qrScreen/qr_scanner.dart';
import '../utils/app_bar.dart';
import '../utils/drawer.dart';
import '../utils/util.dart';
import 'family_home_screen.dart';

/// Family overview
class MyFamilyPage extends StatefulWidget {
  /// Family overview
  const MyFamilyPage({Key key}) : super(key: key);

  @override
  _MyFamilyPageState createState() => _MyFamilyPageState();
}

class _MyFamilyPageState extends State<MyFamilyPage> {
  @override
  void dispose() {
    super.dispose();
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
        ),
        body: Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Familienübersicht',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.left),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                    itemCount: TestData.familyUserDb.length,
                    itemBuilder: (context, index) => Column(
                          children: <Widget>[
                            Card(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        const SizedBox(height: 18),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyFamilyHomeScreenPage(
                                                            selectedUser:
                                                            TestData
                                                                .familyUserDb
                                                                .elementAt(
                                                                    index))));
                                          },
                                          child: ListTile(
                                            title: Text(
                                              TestData.familyUserDb
                                                  .elementAt(index)
                                                  .userName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 18),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        )),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const QRViewExample()));
          },
          backgroundColor: Theme.of(context).accentColor,
          child: const Icon(Icons.add),
        ),
        drawer: MyDrawer(
            isVisible: isDoctor));
}
