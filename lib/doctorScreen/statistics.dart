import 'package:digital_vac_pass/doctorScreen/addvaccination.dart';
import 'package:digital_vac_pass/utils/util.dart';
import 'package:flutter/material.dart';
import '../utils/appBar.dart';
import '../utils/drawer.dart';

class MyStatisticPage extends StatefulWidget {
  MyStatisticPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyStatisticPageState createState() => _MyStatisticPageState();
}

class _MyStatisticPageState extends State<MyStatisticPage> {
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Statistik",
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.left),
              SizedBox(height: 25),
              Card(
                  child:
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    ListTile(
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 18),
                              Text("02.05.2021 - 09.05.2021",
                                  style: Theme.of(context).textTheme.bodyText1),
                            ]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text("Impfungen: 68",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Corona Impfungen: 65",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Corona Tests: 149",
                                textAlign: TextAlign.left),
                            SizedBox(height: 18),
                          ],
                        ))
                  ])),
              SizedBox(height: 20),
              Card(
                  child:
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    ListTile(
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 18),
                              Text("Mai bisher",
                                  style: Theme.of(context).textTheme.bodyText1),
                            ]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text("Impfungen: 248",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Corona Impfungen: 230",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Corona Tests: 1370",
                                textAlign: TextAlign.left),
                            SizedBox(height: 18),
                          ],
                        ))
                  ])),
              SizedBox(height: 20),
              Card(
                  child:
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    ListTile(
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 18),
                              Text("April",
                                  style: Theme.of(context).textTheme.bodyText1),
                            ]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text("Impfungen: 735",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Corona Impfungen: 710",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Corona Tests: 7299",
                                textAlign: TextAlign.left),
                            SizedBox(height: 18),
                          ],
                        ))
                  ])),
              SizedBox(height: 20),
              Card(
                  child:
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    ListTile(
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 18),
                              Text("2021 bisher",
                                  style: Theme.of(context).textTheme.bodyText1),
                            ]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text("Impfungen: 1720",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Corona Impfungen: 1599",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Corona Tests: 14682",
                                textAlign: TextAlign.left),
                            SizedBox(height: 18),
                          ],
                        ))
                  ])),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyVaccinationAddPage()));
        },
        child: const Icon(Icons.qr_code_scanner),
        backgroundColor: Theme.of(context).accentColor,
      ),
      drawer: MyDrawer(isVisible: User.loggedInUser == null ? false : User.loggedInUser.userRole == Role.Doctor ? true : false),
    );
  }
}
