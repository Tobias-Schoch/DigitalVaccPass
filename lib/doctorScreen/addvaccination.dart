import 'dart:io';

import 'package:digital_vac_pass/utils/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import '../qrScreen/qr_scanner.dart';
import '../utils/app_bar.dart';
import '../utils/drawer.dart';
import '../utils/util.dart';

/// add vaccinationn
class MyVaccinationAddPage extends StatefulWidget {
  /// add vaccinationn
  const MyVaccinationAddPage({Key key}) : super(key: key);

  @override
  _MyVaccinationAddPageState createState() => _MyVaccinationAddPageState();
}

class _MyVaccinationAddPageState extends State<MyVaccinationAddPage> {
  DateTime _selectedDate;
  final TextEditingController _textEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isDoctor = User.loggedInUser == null
      ? false
      : User.loggedInUser.userRole == Role.doctor
          ? true
          : false;

  @override
  Widget build(BuildContext context) {
    _textEditingController.text =
        DateFormat('dd.MM.yyyy').format(DateTime.now()).toString();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const MyHeader(),
          elevation: 0,
        ),
        body: Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('Impfung hinzufügen',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.left),
                  const SizedBox(height: 25),
                  TextFormField(
                    cursorColor: Theme.of(context).primaryColorLight,
                    decoration: InputDecoration(
                      labelText: 'Impfung',
                      fillColor: Theme.of(context).accentColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColorLight,
                            width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Theme.of(context).accentColor, width: 3)),
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    ),
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Impfmittel darf nicht leer sein.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    cursorColor: Theme.of(context).primaryColorLight,
                    decoration: InputDecoration(
                      labelText: 'ChargeNr.',
                      fillColor: Theme.of(context).accentColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColorLight,
                            width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Theme.of(context).accentColor, width: 3)),
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    ),
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Chargenummer darf nicht leer sein.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _textEditingController,
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      _selectDate(context);
                    },
                    cursorColor: Theme.of(context).primaryColorLight,
                    decoration: InputDecoration(
                      labelText: 'Datum',
                      fillColor: Theme.of(context).accentColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColorLight,
                            width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Theme.of(context).accentColor, width: 3)),
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    ),
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Datum darf nicht leer sein.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(height: 60),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          FocusScope.of(context).unfocus();
                          sleep(const Duration(milliseconds: 50));
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.size,
                                  alignment: Alignment.bottomCenter,
                                  child: QRViewExample()));
                        }
                      },
                      label: const Text('Hinzufügen',
                          style: TextStyle(fontSize: 20)),
                      icon: const Icon(Icons.qr_code_scanner),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: MyDrawer(
          isVisible: isDoctor,
        ));
  }

  _selectDate(BuildContext context) async {
    final DateTime newSelectedDate = await showDatePicker(
        context: context,
        locale: const Locale('de', 'DE'),
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget child) => Theme(
              data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.light(
                  primary: PredefinedColors.primaryColor,
                  onPrimary: Colors.white,
                  surface: PredefinedColors.primaryColor,
                  onSurface: PredefinedColors.textColor,
                ),
                dialogBackgroundColor: Colors.white,
              ),
              child: child,
            ));

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
