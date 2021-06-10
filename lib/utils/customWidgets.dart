import 'package:digital_vac_pass/qrScreen/qrcode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myVisibleFloatingActionButton(BuildContext context, bool isVisible) {
  return Visibility(
      visible: isVisible,
      child: FloatingActionButton(
        onPressed: () {
          //TODO use HERODialog
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MyQRPage()));
        },
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
      )
  );
}