import 'package:digital_vac_pass/utils/util.dart';
import 'package:flutter/material.dart';
import '../utils/appBar.dart';
import '../utils/drawer.dart';
import 'familyHomeScreen.dart';

class MyFamilyPage extends StatefulWidget {
  MyFamilyPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyFamilyPageState createState() => _MyFamilyPageState();
}

class _MyFamilyPageState extends State<MyFamilyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyHeader(),
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Familienübersicht",
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.left),
            SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                  itemCount: TestData.familyUserDb.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 18),
                                    InkWell(
                                      child: ListTile(
                                        title: Text(
                                          TestData.familyUserDb.elementAt(index).userName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => MyFamilyHomeScreenPage(title: TestData.familyUserDb.elementAt(index).userName, selectedUser: TestData.familyUserDb.elementAt(index))));
                                      },
                                    ),
                                    SizedBox(height: 18),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO open QR-Scanner
        },
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
      ),
      drawer: MyDrawer(
          isVisible: User.loggedInUser.userRole == Role.Doctor ? true : false),
    );
  }
}
