import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:ninja/ninja.dart';

import '../hero_dialog/custom_rect_twin.dart';
import '../hero_dialog/hero_dialog_route.dart';
import '../hero_dialog/hero_widget.dart';
import '../utils/app_bar.dart';
import '../utils/drawer.dart';
import '../utils/rsa.dart';
import '../utils/user.dart';

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
  final TextEditingController _vaccineTextEditingController =
      TextEditingController();
  final TextEditingController _chargeNrTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isQrVisible = false;
  String qrData = '';

  void _buildQrData() {
    final RSAPrivateKey privateKey = RSAPrivateKey.fromPEM(privateKeyPem);
    final RSAPublicKey publicKey = privateKey.toPublicKey;
    qrData = '';

    if (_vaccineTextEditingController.text.isNotEmpty) {
      qrData += 'VACCINE: ${_vaccineTextEditingController.text} \r\n';
    } else {
      qrData = null;
      return;
    }

    if (_chargeNrTextEditingController.text.isNotEmpty) {
      qrData += 'CHARGENR: ${_chargeNrTextEditingController.text} \r\n';
    } else {
      qrData = null;
      return;
    }

    if (_textEditingController.text.isNotEmpty) {
      qrData += 'DATE: ${_textEditingController.text} \r\n';
    } else {
      qrData = null;
      return;
    }

    if (User.loggedInUser != null) {
      qrData += 'DOCTOR: ${User.loggedInUser.userName} \r\n';
      qrData = publicKey.encryptToBase64(qrData);
    } else {
      qrData = null;
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    _textEditingController.text =
        DateFormat('dd.MM.yyyy').format(DateTime.now()).toString();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const MyHeader(),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.sort),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
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
                  Text(AppLocalizations.of(context).addVaccine,
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.left),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _vaccineTextEditingController,
                    cursorColor: Theme.of(context).primaryColorLight,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).vaccine,
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
                        return AppLocalizations.of(context).vaccineCantBeEmpty;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _chargeNrTextEditingController,
                    cursorColor: Theme.of(context).primaryColorLight,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).chargeNr,
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
                        return AppLocalizations.of(context).chargeNrCantBeEmpty;
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
                      labelText: AppLocalizations.of(context).date,
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
                        return AppLocalizations.of(context).dateCantBeEmpty;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {},
                    child: Hero(
                      tag: 'show-qr-hero',
                      createRectTween: (Rect begin, Rect end) =>
                          CustomRectTween(begin: begin, end: end),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(height: 60),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              FocusScope.of(context).unfocus();
                              sleep(const Duration(milliseconds: 50));
                              _buildQrData();
                              Navigator.of(context).push(HeroDialogRoute(
                                builder: (BuildContext context) =>
                                    PopupCard(qrData),
                              ));
                            }
                          },
                          label: Text(AppLocalizations.of(context).generateQr,
                              style: const TextStyle(fontSize: 20)),
                          icon: const Icon(Icons.qr_code_2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: const MyDrawer());
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime newSelectedDate = await showDatePicker(
        context: context,
        locale: const Locale('de', 'DE'),
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget child) => Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: Theme.of(context).accentColor,
                  surface: Theme.of(context).accentColor,
                  onSurface: Theme.of(context).primaryColorLight,
                ),
                dialogBackgroundColor: Theme.of(context).primaryColor,
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<bool>('isQrVisible_addvac', isQrVisible));
    properties.add(DiagnosticsProperty<String>('qrData_addvac', qrData));
  }
}
