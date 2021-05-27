
import 'package:digital_vac_pass/util.dart';
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
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: vaccinationListDb.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {print(index);} ,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(

                                  children: <Widget>[
                                    ListTile(

                                      title: Text(vaccinationListDb.elementAt(index).vaccinationName),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('ChargeNr. ' + vaccinationListDb.elementAt(index).chargeNr),
                                          Text('Description: ' + vaccinationListDb.elementAt(index).vaccinationDescription),
                                          Text('Doctor: ' + vaccinationListDb.elementAt(index).doctorSignature),
                                        ],
                                      )
                                    )
                                  ],
                                )
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    DateFormat('dd-MM-yyyy').format(vaccinationListDb.elementAt(index).vaccinationDate)
                                  ),
                                  Text(
                                      DateFormat('hh:mm').format(vaccinationListDb.elementAt(index).vaccinationDate)
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

      ),
    );
  }
}

List<Vaccination> vaccinationListDb = List<Vaccination>.generate(20, (int i) {
  return Vaccination(faker.lorem.word(), faker.randomGenerator.decimal().toString(), faker.date.dateTime(), faker.person.name(), faker.lorem.sentence());
});