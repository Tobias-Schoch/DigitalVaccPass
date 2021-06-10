import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import '../qrScreen/qrScanner.dart';
import '../utils/util.dart';
import '../utils/appBar.dart';
import '../utils/drawer.dart';


class MyVaccinationAddPage extends StatefulWidget {
  MyVaccinationAddPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyVaccinationAddPageState createState() => _MyVaccinationAddPageState();
}

class _MyVaccinationAddPageState extends State<MyVaccinationAddPage> {
  DateTime _selectedDate;
  TextEditingController _textEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = DateFormat('dd.MM.yyyy').format(DateTime.now()).toString();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: MyHeader(),
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Impfung hinzufügen",
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.left),
                SizedBox(height: 25),
                TextFormField(
                  cursorColor: Theme.of(context).primaryColorLight,
                  decoration: new InputDecoration(
                    labelText: "Impfung",
                    fillColor: Theme.of(context).accentColor,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      borderSide: new BorderSide(
                          color: Theme.of(context).accentColor, width: 3.0),
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      borderSide: new BorderSide(
                          color: Theme.of(context).primaryColorLight,
                          width: 3.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 3.0)),
                    labelStyle: new TextStyle(
                        color: Theme.of(context).primaryColorLight),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Impfmittel darf nicht leer sein.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                TextFormField(
                  cursorColor: Theme.of(context).primaryColorLight,
                  decoration: new InputDecoration(
                    labelText: "ChargeNr.",
                    fillColor: Theme.of(context).accentColor,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      borderSide: new BorderSide(
                          color: Theme.of(context).accentColor, width: 3.0),
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      borderSide: new BorderSide(
                          color: Theme.of(context).primaryColorLight,
                          width: 3.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 3.0)),
                    labelStyle: new TextStyle(
                        color: Theme.of(context).primaryColorLight),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Chargenummer darf nicht leer sein.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: _textEditingController,
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    _selectDate(context);
                  },
                  cursorColor: Theme.of(context).primaryColorLight,
                  decoration: new InputDecoration(
                    labelText: "Datum",
                    fillColor: Theme.of(context).accentColor,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      borderSide: new BorderSide(
                          color: Theme.of(context).accentColor, width: 3.0),
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      borderSide: new BorderSide(
                          color: Theme.of(context).primaryColorLight,
                          width: 3.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 3.0)),
                    labelStyle: new TextStyle(
                        color: Theme.of(context).primaryColorLight),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Datum darf nicht leer sein.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(height: 60),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        FocusScope.of(context).unfocus();
                        sleep(Duration(milliseconds:50));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => QRViewExample()));
                      }
                    },
                    label:
                        Text('Hinzufügen', style: new TextStyle(fontSize: 20)),
                    icon: Icon(Icons.qr_code_scanner),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: MyDrawer(isVisible: true),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        locale: const Locale("de", "DE"),
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: PredefinedColors.primaryColor,
                onPrimary: Colors.white,
                surface: PredefinedColors.primaryColor,
                onSurface: PredefinedColors.textColor,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat('dd.MM.yyyy').format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }


  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}