import 'package:qr_flutter/qr_flutter.dart';
import 'package:digital_vac_pass/utils/util.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../utils/appBar.dart';
import '../utils/drawer.dart';


class MyQRPage extends StatefulWidget {
  MyQRPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyQRPageState createState() => _MyQRPageState();
}

class _MyQRPageState extends State<MyQRPage> {

  static String qrData(String email) {
    String qrData;
    TestData.userListDb.forEach((element) {
      if (element.userEmail.compareTo(email) == 0) {
        qrData = element.userEmail;
      }
    });
    return qrData;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Change icon and action for qrcode, for better ui
        // TODO: Check from where coming & (de-) activate leading
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: MyHeader(),
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Text(
                "Mein QR-Code",
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 25),
            Flexible(
              child: Row(
                children: [
                  Visibility(
                    visible: User.loggedInUser == null ? false : true,
                    child: QrImage(
                      data: qrData(LastUser.lastUser),
                      version: QrVersions.auto,
                    ),
                  ),
                  Visibility(
                    visible: User.loggedInUser == null ? true : false,
                    child: Image.asset("assets/images/qr.png", width: 200),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(
          isVisible: User.loggedInUser == null
              ? false
              : User.loggedInUser.userRole == Role.Doctor
                  ? true
                  : false),
    );
  }
}
