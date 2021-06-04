import 'package:digital_vac_pass/qrScreen/qrScanner.dart';
import 'package:digital_vac_pass/statisticScreen/statistics.dart';
import 'package:flutter/material.dart';
import '../utils/appBar.dart';
import '../utils/drawer.dart';
import 'package:intl/intl.dart';

class MyVaccinationAddPage extends StatefulWidget {
  MyVaccinationAddPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyVaccinationAddPageState createState() => _MyVaccinationAddPageState();
}

class _MyVaccinationAddPageState extends State<MyVaccinationAddPage> {
  var now = new DateTime.now();
  var formatter = new DateFormat('dd.MM.yyyy');
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Impfung hinzufügen",
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.left),
              SizedBox(height: 25),
              new TextFormField(
                autofocus: true,
                cursorColor: Theme.of(context).primaryColorLight,
                decoration: new InputDecoration(
                  labelText: "Impfung",
                  fillColor: Theme.of(context).accentColor,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(color: Theme.of(context).accentColor, width: 3.0),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(color: Theme.of(context).primaryColorLight, width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Theme.of(context).accentColor, width: 3.0)),
                  labelStyle: new TextStyle(color: Theme.of(context).primaryColorLight),
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "Impfmittel darf nicht leer sein.";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 25),
              new TextFormField(
                cursorColor: Theme.of(context).primaryColorLight,
                decoration: new InputDecoration(
                  labelText: "ChargeNr.",
                  fillColor: Theme.of(context).accentColor,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(color: Theme.of(context).accentColor, width: 3.0),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(color: Theme.of(context).primaryColorLight, width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Theme.of(context).accentColor, width: 3.0)),
                  labelStyle: new TextStyle(color: Theme.of(context).primaryColorLight),
                ),
              ),
              SizedBox(height: 25),
              new TextFormField(

                initialValue: formatter.format(now).toString(),
                cursorColor: Theme.of(context).primaryColorLight,
                decoration: new InputDecoration(
                  labelText: "Datum",
                  fillColor: Theme.of(context).accentColor,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(color: Theme.of(context).accentColor, width: 3.0),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(color: Theme.of(context).primaryColorLight, width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Theme.of(context).accentColor, width: 3.0)),
                  labelStyle: new TextStyle(color: Theme.of(context).primaryColorLight),
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "Datum darf nicht leer sein.";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 25),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 60),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => QRViewExample()));
                  },
                  label: Text('Hinzufügen', style: new TextStyle(fontSize: 20)),
                  icon: Icon(Icons.qr_code_scanner),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(isVisible: true),
    );
  }
}
