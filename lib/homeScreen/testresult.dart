import 'package:digital_vac_pass/util.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tests",
            style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.left),
            SizedBox(height: 25),
            Expanded(
                child: ListView.builder(
                    itemCount: testsListDb.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 10,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        ListTile(
                                          tileColor: testsListDb
                                            .elementAt(index)
                                            .testStatus == Status.Pending
                                              ? pending
                                              : testsListDb.elementAt(index).testStatus == Status.Good
                                              ? negative : positive,
                                          title: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 18),
                                              Text(
                                                testsListDb.elementAt(index).testName,
                                                style: Theme.of(context).textTheme.bodyText1,
                                              ),
                                            ],
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 10),
                                              Text('Datum.: ' +
                                                  DateFormat('dd.MM.yyyy').format(
                                                      testsListDb
                                                          .elementAt(index)
                                                          .testDate)),
                                              SizedBox(height: 8),
                                              Text('Test-ID: ' +
                                                  testsListDb
                                                      .elementAt(index)
                                                      .testId),
                                              SizedBox(height: 8),
                                              Text(testsListDb
                                                      .elementAt(index)
                                                      .testStatus.toString()),
                                              SizedBox(height: 18),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

List<Test> testsListDb = List<Test>.generate(20, (int i) {
  return Test(
      faker.lorem.word(),
      faker.randomGenerator.decimal().toString(),
      faker.date.dateTime(),
      faker.randomGenerator.element(Status.values),
      faker.lorem.sentence());
});
