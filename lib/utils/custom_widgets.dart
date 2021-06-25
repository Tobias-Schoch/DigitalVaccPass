import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../qrScreen/qr_scanner.dart';
import '../qrScreen/qrcode.dart';

/// Floating Button for qr code page
Widget myVisibleFloatingActionButton(BuildContext context, bool isVisible) =>
    Visibility(
        visible: isVisible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const MyQRPage()));
          },
          backgroundColor: Theme.of(context).accentColor,
          child: const Icon(Icons.add),
        ));

/// Floating Button for qr scanner page
Widget myVisibleFloatingActionButtonForQrScanner(
        BuildContext context, bool isVisible, String calledFromWidget) =>
    Visibility(
        visible: isVisible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    QRViewExample(calledFrom: calledFromWidget)));
          },
          backgroundColor: Theme.of(context).accentColor,
          child: const Icon(Icons.add),
        ));
