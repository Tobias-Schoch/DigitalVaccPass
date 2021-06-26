import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../utils/app_bar.dart';
import '../utils/drawer.dart';
import '../utils/user.dart';
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
    const String qrData = '';

    // if (User.loggedInUser != null) {
    //   List<Vaccination> vaccList = VaccinationDAO.getAllVaccinesForUser
    //   (User.loggedInUser.userDbId);
    //   List<Test> testList = TestDAO.getAllTestsForUser
    //   (User.loggedInUser.userDbId);
    //   qrData += "EMAIL: " + User.loggedInUser.userEmail + "\r\n";
    //   qrData += "NAME: " + User.loggedInUser.userName + "\r\n";
    //
    //   if (vaccList.isNotEmpty) {
    //     qrData += "VACCINES[";
    //     vaccList.forEach((element) {
    //       qrData += "VACCINE[";
    //       qrData += "NAME: " + element.vaccinationName + "\r\n";
    //       qrData += "CHARGENR: " + element.chargeNr + "\r\n";
    //       qrData += "DATE: " + element.vaccinationDate.toString() + "\r\n";
    //       qrData += "DOC: " + element.doctorSignature + "\r\n";
    //       qrData += "DESCR: " + element.vaccinationDescription + "\r\n";
    //       qrData += "]";
    //     });
    //     qrData += "]";
    //   }
    //   if (testList.isNotEmpty) {
    //     qrData += "TESTS[";
    //     testList.forEach((element) {
    //       qrData += "TEST[";
    //       qrData += "NAME: " + element.testName + "\r\n";
    //       qrData += "IDNR: " + element.testIdNr + "\r\n";
    //       qrData += "DATE: " + element.testDate.toString() + "\r\n";
    //       qrData += "STATUS: " + element.testStatus.toString() + "\r\n";
    //       qrData += "DESCR: " + element.testDescription + "\r\n";
    //       qrData += "FAMILY_ID: " + element.familyId.toString() + "\r\n";
    //       qrData += "]";
    //     });
    //     qrData += "]";
    //   }
    // }

    return qrData;
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  QrImage(
                    data: qrData(LastUser.lastUser),
                    size: MediaQuery.of(context).size.width * 0.9,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer());
}
