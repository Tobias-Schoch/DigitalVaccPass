import 'package:digital_vac_pass/util.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import '../appBar.dart';
import '../drawer.dart';

class MyTestPage extends StatefulWidget {
  MyTestPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyTestPageState createState() => _MyTestPageState();
}

class _MyTestPageState extends State<MyTestPage> {
  @override
  Widget build(BuildContext context) {
    const pending = const Color(0xffFFFACC);
    const positive = const Color(0xffFEC3C3);
    const negative = const Color(0xffDEFFDB);
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Covid-19 Test",
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.left),
              SizedBox(height: 25),
              Card(
                  color: pending,
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
                            Text("Antigen Test",
                                style: Theme.of(context).textTheme.headline5),
                          ]),
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text("Test-ID: 123845234",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Datum: 27.05.2021",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Arzt: Dr. Peter Schmidt",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Ausstehend",
                                style: Theme.of(context).textTheme.bodyText1),
                            SizedBox(height: 18),
                          ]),
                    ),
                  ])),
              SizedBox(height: 20),
              Card(
                  color: negative,
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
                            Text("Antigen Test",
                                style: Theme.of(context).textTheme.headline5),
                          ]),
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text("Test-ID: 123845234",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Datum: 08.05.2021",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Arzt: Dr. Peter Schmidt",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Negativ",
                                style: Theme.of(context).textTheme.bodyText1),
                            SizedBox(height: 18),
                          ]),
                    ),
                  ])),
              SizedBox(height: 20),
              Card(
                  color: positive,
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
                            Text("Antigen Test",
                                style: Theme.of(context).textTheme.headline5),
                          ]),
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text("Test-ID: 122354234",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Datum: 12.04.2021",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Arzt: Dr. Peter Schmidt",
                                textAlign: TextAlign.left),
                            SizedBox(height: 8),
                            Text("Positiv",
                                style: Theme.of(context).textTheme.bodyText1),
                            SizedBox(height: 18),
                          ]),
                    ),
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

List<Test> vaccinationListDb = List<Test>.generate(20, (int i) {
  return Test.newlyWithoutStatus(faker.lorem.word(), faker.randomGenerator.decimal().toString(), faker.date.dateTime(), faker.lorem.sentence());
});