import 'dart:io';

import 'package:digital_vac_pass/database/vaccination_DAO.dart';
import 'package:digital_vac_pass/homeScreen/vaccination.dart';
import 'package:digital_vac_pass/utils/user.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../doctorScreen/statistics.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../utils/app_bar.dart';
import '../utils/util.dart';

/// QR Scanner
class QRViewExample extends StatefulWidget {
  /// QR Scanner
  const QRViewExample({Key key, this.calledFrom}) : super(key: key);

  final String calledFrom;

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
            onPressed: () => Navigator.pop(
                context,
                PageTransition(
                    type: PageTransitionType.size,
                    alignment: Alignment.bottomCenter))
          ),
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
    final scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: PredefinedColors.primaryColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 15,
          cutOutSize: scanArea),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      sleep(const Duration(milliseconds: 10));
      setState(() {
        switch (widget.calledFrom) {
          case "VACCINE": _calledFromVaccine(scanData); break;
          case "TEST": _calledFromTest(scanData); break;
          case "FAMILY": _calledFromFamily(scanData); break;
          default: break;
        }
      });
    });
  }

  void _calledFromVaccine(result) {
    if (result != null) {
      barcodeString = result.code.toString();
      if (barcodeString.contains('VACCINE:') && barcodeString.contains('CHARGENR:') && barcodeString.contains('DATE:') && barcodeString.contains('DOCTOR:')) {
        String vaccineName = barcodeString.substring(barcodeString.indexOf("VACCINE:") + 8, barcodeString.indexOf("\r\nCHARGENR:"));
        String chargeNr = barcodeString.substring(barcodeString.indexOf("CHARGENR:") + 9, barcodeString.indexOf("\r\nDATE:"));
        String dateAsString = barcodeString.substring(barcodeString.indexOf("DATE:") + 5, barcodeString.indexOf("\r\nDOCTOR:"));
        List<String> c = dateAsString.split(".");
        String doctorName = barcodeString.substring(barcodeString.indexOf("DOCTOR:") + 7);
        DateTime date = DateTime.utc(int.parse(c.elementAt(2)), int.parse(c.elementAt(1)), int.parse(c.elementAt(0)));
        VaccinationDAO.create(vaccineName, chargeNr, date, doctorName, null, User.loggedInUser.userDbId, null);
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.size,
                alignment: Alignment.bottomCenter,
                child: MyVaccinationPage(isFloatingActionButtonVisible: true, selectedUser: User.loggedInUser)));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: 320,
            duration: const Duration(milliseconds: 3000),
            content: Container(
                height: 20,
                child: Center(
                  child:  Text(
                    AppLocalizations.of(context).vaccineAdded,
                    textAlign: TextAlign.center,
                  ),
                )
            ),
          ),
        );
      }
    }
  }

  void _calledFromTest(result) {
    if (result != null) {
      barcodeString = result.code.toString();

    }
  }

  void _calledFromFamily(result) {
    if (result != null) {
      barcodeString = result.code.toString();

    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
