import 'package:digital_vac_pass/utils/user.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../utils/app_bar.dart';
import '../utils/drawer.dart';
import '../utils/util.dart';

/// Generate qr code
class MyQRPage extends StatefulWidget {
  /// Generate qr code
  const MyQRPage({Key key}) : super(key: key);

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

  bool isDoctor = User.loggedInUser == null
      ? false
      : User.loggedInUser.userRole == Role.doctor
      ? true
      : false;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        // Change icon and action for qrcode, for better ui
        // Check from where coming & (de-) activate leading
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: const MyHeader(),
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Text(
                'Mein QR-Code',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 25),
            Flexible(
              child: Row(
                children: <Widget>[
                  Visibility(
                    visible: User.loggedInUser == null ? false : true,
                    child: QrImage(
                      data: qrData(LastUser.lastUser),
                      version: QrVersions.auto,
                      size: 200,
                    ),
                  ),
                  Visibility(
                    visible: User.loggedInUser == null ? true : false,
                    child: Image.asset('assets/images/qr.png', width: 200),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(isVisible: isDoctor));
}
