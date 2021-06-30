import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:ninja/ninja.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;

import '../database/family_dao.dart';
import '../database/test_dao.dart';
import '../database/vaccination_dao.dart';
import '../familyScreen/family.dart';
import '../homeScreen/test_screen.dart';
import '../homeScreen/vaccination_screen.dart';
import '../utils/app_bar.dart';
import '../utils/rsa.dart';
import '../utils/test.dart';
import '../utils/user.dart';
import '../utils/util.dart';
import '../utils/vaccination.dart';

/// QR Scanner
class QRViewExample extends StatefulWidget {
  /// QR Scanner
  const QRViewExample({Key key, this.calledFrom}) : super(key: key);

  final String calledFrom;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<String>('calledFrom_qr_scanner', calledFrom));
  }

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode result;
  String barcodeString;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          title: const MyHeader(),
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildQrView(context)),
          ],
        ),
      );

  Widget _buildQrView(BuildContext context) {
    final double scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Theme.of(context).accentColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 15,
          cutOutSize: scanArea),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    final RSAPrivateKey privateKey = RSAPrivateKey.fromPEM(privateKeyPem);
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData)  {
      setState(() async {
        await controller.stopCamera();
        switch (widget.calledFrom) {
          case 'VACCINE':
            _calledFromVaccine(privateKey.decryptToUtf8(scanData));
            break;
          case 'TEST':
            _calledFromTest(scanData);
            break;
          case 'FAMILY':
            _calledFromFamily(scanData);
            break;
          default:
            break;
        }
      });
    });
  }

  void _calledFromVaccine(String result) {
    if (result != null) {
      if (barcodeString.contains('VACCINE:') &&
          barcodeString.contains('CHARGENR:') &&
          barcodeString.contains('DATE:') &&
          barcodeString.contains('DOCTOR:')) {
        final String vaccineName = barcodeString.substring(
            barcodeString.indexOf('VACCINE:') + 8,
            barcodeString.indexOf('\r\nCHARGENR:'));
        final String chargeNr = barcodeString.substring(
            barcodeString.indexOf('CHARGENR:') + 9,
            barcodeString.indexOf('\r\nDATE:'));
        final String dateAsString = barcodeString.substring(
            barcodeString.indexOf('DATE:') + 5,
            barcodeString.indexOf('\r\nDOCTOR:'));
        final List<String> c = dateAsString.split('.');
        final String doctorName =
            barcodeString.substring(barcodeString.indexOf('DOCTOR:') + 7);
        final DateTime date = DateTime.utc(int.parse(c.elementAt(2)),
            int.parse(c.elementAt(1)), int.parse(c.elementAt(0)));
        VaccinationDAO.create(vaccineName, chargeNr, date, doctorName, null,
            User.loggedInUser.userDbId, null);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => MyVaccinationPage(
                isFloatingActionButtonVisible: true,
                selectedUser: User.loggedInUser)));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: 320,
            duration: const Duration(milliseconds: 3000),
            content: Container(
                height: 20,
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).vaccineAdded,
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        );
      }
    }
  }

  _calledFromTest(Barcode result) async {
    if (result != null) {
      barcodeString = result.code.toString();

      /// url for testing
      // barcodeString = 'https://app.soda-software.de/result/8acb8033ffe2fc52fc9f57f23023965776e03e08dd269f0b';
      if (barcodeString.contains('https://app.soda')) {
        final http.Response resp = await http.get(Uri.parse(barcodeString));
        final String body = resp.body;

        final String testDateString =
            body.substring(body.indexOf('%M\">') + 4, body.indexOf('</time'));
        final DateTime testDate =
            DateFormat('dd.MM.yyyy hh:mm').parse(testDateString);
        String testName = '';
        final Status testStatus = body.contains('NEGATIVE')
            ? Status.good
            : body.contains('POSITIVE')
                ? Status.bad
                : Status.pending;

        final List<String> test1 = body.split('\n');
        for (int i = 0; i < test1.length; i++) {
          if (test1[i].contains('Test type')) {
            testName = test1[i + 1].substring(
                test1[i + 1].indexOf('>') + 1, test1[i + 1].indexOf('</'));
            break;
          }
        }
        if (testName.isNotEmpty) {
          await TestDAO.create(testName, '', testDate, testStatus, null,
              User.loggedInUser.userDbId, null);
        }
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => MyTestPage(
                isFloatingActionButtonVisible: true,
                selectedUser: User.loggedInUser)));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: 320,
            duration: const Duration(milliseconds: 3000),
            content: Container(
                height: 20,
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).testAdded,
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        );
      }
    }
  }

  _calledFromFamily(Barcode result) async {
    if (result != null) {
      barcodeString = result.code.toString();
      if (barcodeString.contains('EMAIL:') &&
              barcodeString.contains('NAME:') &&
              barcodeString.contains('VACCINES') ||
          barcodeString.contains('TESTS')) {
        final int familyId = await _addFamilyMember(barcodeString);
        if (barcodeString.contains('TESTS') && familyId != null) {
          final String tests = barcodeString.substring(
              barcodeString.indexOf('TESTS'), barcodeString.indexOf('3]'));
          final List<String> testList = tests.split(']');
          _addTests(testList, familyId);
        }
        if (barcodeString.contains('VACCINES') && familyId != null) {
          final String vaccines = barcodeString.substring(
              barcodeString.indexOf('VACCINES'), barcodeString.indexOf('4]'));
          final List<String> vaccineList = vaccines.split(']');
          _addVaccines(vaccineList, familyId);
        }
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const MyFamilyPage()));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: 320,
            duration: const Duration(milliseconds: 3000),
            content: Container(
                height: 20,
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).familyMemberAdded,
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        );
      }
    }
  }

  Future<int> _addFamilyMember(String qrCodeString) {
    final String familyMemberEmail = qrCodeString.substring(
        qrCodeString.indexOf('EMAIL: ') + 7, qrCodeString.indexOf('0\n'));
    final String familyMemberName = qrCodeString.substring(
        qrCodeString.indexOf('NAME: ') + 6, qrCodeString.indexOf('1\n'));
    if (familyMemberName.isNotEmpty && familyMemberEmail.isNotEmpty) {
      return FamilyDAO.create(familyMemberName, familyMemberEmail);
    }
  }

  _addTests(List<String> qrCodeString, int familyId) async {
    final List<Test> testsList = List.empty(growable: true);
    for (int i = 0; i < qrCodeString.length; i++) {
      if (qrCodeString[i].contains('TEST')) {
        final String testName = qrCodeString[i].substring(
            qrCodeString[i].indexOf('NAME: ') + 6,
            qrCodeString[i].indexOf('\nIDNR'));
        final String idNr = qrCodeString[i].substring(
            qrCodeString[i].indexOf('IDNR: ') + 6,
            qrCodeString[i].indexOf('\nDA'));
        final String dateString = qrCodeString[i].substring(
            qrCodeString[i].indexOf('DATE: ') + 6,
            qrCodeString[i].indexOf('\nST'));
        final String statusString = qrCodeString[i].substring(
            qrCodeString[i].indexOf('STATUS: ') + 7,
            qrCodeString[i].indexOf('\nDE'));
        final String descr = qrCodeString[i].substring(
            qrCodeString[i].indexOf('DESCR: ') + 6,
            qrCodeString[i].indexOf('\nFAMILY_ID'));
        final Status testStatus = statusString.contains('good')
            ? Status.good
            : statusString.contains('bad')
                ? Status.bad
                : Status.pending;
        final DateTime date = Util.getDateTimeFromString(dateString);
        testsList.add(Test.forDb(
            testName, idNr, date, testStatus, descr, null, familyId));
      }
    }
    await TestDAO.createBatch(testsList);
  }

  _addVaccines(List<String> qrCodeString, int familyId) async {
    final List<Vaccination> vaccineList = List.empty(growable: true);
    for (int i = 0; i < qrCodeString.length; i++) {
      if (qrCodeString[i].contains('VACCINE')) {
        final String vaccinationName = qrCodeString[i].substring(
            qrCodeString[i].indexOf('NAME: ') + 6,
            qrCodeString[i].indexOf('\nCH'));
        final String chargeNr = qrCodeString[i].substring(
            qrCodeString[i].indexOf('CHARGENR: ') + 10,
            qrCodeString[i].indexOf('\nDA'));
        final String dateString = qrCodeString[i].substring(
            qrCodeString[i].indexOf('DATE: ') + 6,
            qrCodeString[i].indexOf('\nDO'));
        final String doctor = qrCodeString[i].substring(
            qrCodeString[i].indexOf('DOC: ') + 5,
            qrCodeString[i].indexOf('\nDE'));
        String descr =
            qrCodeString[i].substring(qrCodeString[i].indexOf('DESCR: ') + 6);
        if (descr.contains('\n')) {
          descr = descr.replaceAll('\n', '');
        }
        final DateTime date = Util.getDateTimeFromString(dateString);
        vaccineList.add(Vaccination.forDb(
            vaccinationName, chargeNr, date, doctor, descr, null, familyId));
      }
    }
    await VaccinationDAO.createBatch(vaccineList);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Barcode>('result_qr_scanner', result));
    properties.add(
        DiagnosticsProperty<String>('barcodeString_qr_scanner', barcodeString));
    properties.add(DiagnosticsProperty<QRViewController>(
        'controller_qr_scanner', controller));
    properties.add(DiagnosticsProperty<GlobalKey>('qrKey_qr_scanner', qrKey));
  }
}
