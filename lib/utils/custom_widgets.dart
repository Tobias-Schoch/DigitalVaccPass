import 'package:digital_vac_pass/qrScreen/qr_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../qrScreen/qrcode.dart';

Widget myVisibleFloatingActionButton(BuildContext context, bool isVisible) =>
    Visibility(
        visible: isVisible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MyQRPage()));
          },
          backgroundColor: Theme.of(context).accentColor,
          child: const Icon(Icons.add),
        ));

Widget myVisibleFloatingActionButtonForQrScanner(BuildContext context, bool isVisible, String calledFromWidget) =>
    Visibility(
        visible: isVisible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => QRViewExample(calledFrom: calledFromWidget)));
          },
          backgroundColor: Theme.of(context).accentColor,
          child: const Icon(Icons.add),
        ));