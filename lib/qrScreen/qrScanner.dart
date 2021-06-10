import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../doctorScreen/statistics.dart';
import '../utils/appBar.dart';
import '../utils/util.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode result;
  String barcodeString;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
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
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    final scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
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
        if (result != null && barcodeString.contains("@")) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const MyStatisticPage()));
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
