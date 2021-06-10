import 'package:qr_flutter/qr_flutter.dart';
import 'package:digital_vac_pass/utils/util.dart';
import 'package:flutter/material.dart';
import '../utils/appBar.dart';
import '../utils/drawer.dart';

class MyQRPage extends StatefulWidget {
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
      drawer: MyDrawer(
          isVisible: User.loggedInUser == null
              ? false
              : User.loggedInUser.userRole == Role.Doctor
                  ? true
                  : false),
    );
  }
}
