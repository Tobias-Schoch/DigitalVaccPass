import 'dart:io';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../doctorScreen/statistics.dart';
import '../utils/app_bar.dart';
import '../utils/util.dart';

/// QR Scanner
class QRViewExample extends StatefulWidget {
  /// QR Scanner
  const QRViewExample({Key key}) : super(key: key);

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
        result = scanData;
        barcodeString = result.code.toString();
        if (result != null && barcodeString.contains('@')) {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.size,
                  alignment: Alignment.bottomCenter,
                  child: const MyStatisticPage()));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              width: 320,
              duration: const Duration(milliseconds: 3000),
              content: Container(
                  height: 20,
                  child: const Center(
                    child: const Text(
                      'Impfung hinzugefügt.',
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
