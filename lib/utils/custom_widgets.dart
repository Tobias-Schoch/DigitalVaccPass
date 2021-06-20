import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../qrScreen/qrcode.dart';

/// Hero Dialog
Widget myVisibleFloatingActionButton(BuildContext context, bool isVisible) =>
    Visibility(
        visible: isVisible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyQRPage()));
          },
          backgroundColor: Theme.of(context).accentColor,
          child: const Icon(Icons.add),
        ));
