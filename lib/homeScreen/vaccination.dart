import 'package:digital_vac_pass/qrScreen/qrcode.dart';
import 'package:digital_vac_pass/utils/util.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyVaccinationPage extends StatefulWidget {
  MyVaccinationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _MyVaccinationPage();
}

class _MyVaccinationPage extends State<MyVaccinationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Impfpass",
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.left),
            SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                itemCount: vaccinationListDb.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      print(index);
                    },
                    child: Column(
                      children: [
                        Card(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      title: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 18),
                                            Text(
                                                vaccinationListDb
                                                    .elementAt(index)
                                                    .vaccinationName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1),
                                          ]),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10),
                                          Text('Datum: ' +
                                              DateFormat('dd.MM.yyyy').format(
                                                  vaccinationListDb
                                                      .elementAt(index)
                                                      .vaccinationDate)),
                                          SizedBox(height: 8),
                                          Text('ChargeNr: ' +
                                              vaccinationListDb
                                                  .elementAt(index)
                                                  .chargeNr),
                                          SizedBox(height: 8),
                                          Text('Arzt: ' +
                                              vaccinationListDb
                                                  .elementAt(index)
                                                  .doctorSignature),
                                          SizedBox(height: 18),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    )
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MyQRPage()));
        },
        child: const Icon(Icons.qr_code),
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }
}

List<Vaccination> vaccinationListDb = List<Vaccination>.generate(20, (int i) {
  return Vaccination(
      faker.food.dish(),
      faker.randomGenerator.decimal().toString(),
      faker.date.dateTime(),
      faker.person.name(),
      faker.lorem.sentence());

});

//FOR GOLDEN TESTS
// String strDt = "2021-05-28";
// List<Vaccination> vaccinationListDb = [new Vaccination("covid", "0001", DateTime.parse(strDt), "kekDoctor", "beschreibung"),
//   new Vaccination("covid2", "0002", DateTime.parse(strDt), "kekDoctor2", "beschreibung2"),
//   new Vaccination("covid3", "0003", DateTime.parse(strDt), "kekDoctor3", "beschreibung3")];
