import 'package:digital_vac_pass/utils/customWidgets.dart';
import 'package:digital_vac_pass/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyVaccinationPage extends StatefulWidget {
  MyVaccinationPage({Key key, this.title, this.selectedUser, this.isFloatingActionButtonVisible}) : super(key: key);

  final String title;
  final User selectedUser;
  final bool isFloatingActionButtonVisible;

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
            Text(widget.selectedUser.userName,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center),
            SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                itemCount: widget.selectedUser.vaccinations.length,
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
                                                  widget
                                                      .selectedUser.vaccinations
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
                                                    widget.selectedUser
                                                        .vaccinations
                                                        .elementAt(index)
                                                        .vaccinationDate)),
                                            SizedBox(height: 8),
                                            Text('ChargeNr: ' +
                                                widget.selectedUser.vaccinations
                                                    .elementAt(index)
                                                    .chargeNr),
                                            SizedBox(height: 8),
                                            Text('Arzt: ' +
                                                widget.selectedUser.vaccinations
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
                      ));
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: myVisibleFloatingActionButton(context, widget.isFloatingActionButtonVisible),
    );
  }
}
