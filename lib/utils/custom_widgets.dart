import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../qrScreen/qrcode.dart';

/// Hero Dialog
Widget myVisibleFloatingActionButton(BuildContext context, bool isVisible) =>
    Visibility(
        visible: isVisible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.size,
                    alignment: Alignment.bottomCenter,
                    child: const MyQRPage()));
          },
          backgroundColor: Theme.of(context).accentColor,
          child: const Icon(Icons.add),
        ));
