import 'package:digital_vac_pass/utils/util.dart';
import 'package:flutter/material.dart';
import 'appBar.dart';
import 'drawer.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
        qrData += element.userName;
      }
    });
    print(qrData);
    return qrData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  style: Theme.of(context).textTheme.headline4, textAlign: TextAlign.start,
                ),
            ),
            SizedBox(height: 25),
            QrImage(
              data: qrData(LastUser.lastUser),
              version: QrVersions.auto,
              size: 200,
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
