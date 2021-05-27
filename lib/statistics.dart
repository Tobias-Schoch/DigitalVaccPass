import 'package:digital_vac_pass/addvaccination.dart';
import 'package:flutter/material.dart';
import 'appBar.dart';
import 'drawer.dart';

class MyStatisticPage extends StatefulWidget {
  MyStatisticPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyStatisticPageState createState() => _MyStatisticPageState();
}

class _MyStatisticPageState extends State<MyStatisticPage> {
  @override
  Widget build(BuildContext context) {
    const primeColor = const Color(0xff5D5FEF);
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
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 60, width: 1000),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    primary: primeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyVaccinationAddPage()));
                  },
                  label: Text('Impfung hinzufügen', style: new TextStyle(fontSize: 20)),
                  icon: Icon(Icons.healing),
                ),
              ),
              SizedBox(height: 20),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 10,
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 10,
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 10,
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 10,
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
      drawer: MyDrawer(),
    );
  }
}
