import 'package:digital_vac_pass/statistics.dart';
import 'package:flutter/material.dart';
import 'appBar.dart';
import 'drawer.dart';

class MyVaccinationAddPage extends StatefulWidget {
  MyVaccinationAddPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyVaccinationAddPageState createState() => _MyVaccinationAddPageState();
}

class _MyVaccinationAddPageState extends State<MyVaccinationAddPage> {
  @override
  Widget build(BuildContext context) {
    const primeColor = const Color(0xff5D5FEF);
    const textColor = const Color(0xff263238);
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
                cursorColor: textColor,
                decoration: new InputDecoration(
                  labelText: "Impfung",
                  fillColor: primeColor,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(color: primeColor, width: 3.0),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(color: textColor, width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: primeColor, width: 3.0)),
                  labelStyle: new TextStyle(color: textColor),
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
                cursorColor: textColor,
                decoration: new InputDecoration(
                  labelText: "ChargeNr.",
                  fillColor: primeColor,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(color: primeColor, width: 3.0),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(color: textColor, width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: primeColor, width: 3.0)),
                  labelStyle: new TextStyle(color: textColor),
                ),
              ),
              SizedBox(height: 25),
              new TextFormField(
                cursorColor: textColor,
                decoration: new InputDecoration(
                  labelText: "Datum",
                  fillColor: primeColor,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(color: primeColor, width: 3.0),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(color: textColor, width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: primeColor, width: 3.0)),
                  labelStyle: new TextStyle(color: textColor),
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
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    primary: primeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyStatisticPage()));
                  },
                  label: Text('Hinzufügen', style: new TextStyle(fontSize: 20)),
                  icon: Icon(Icons.qr_code_scanner),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
