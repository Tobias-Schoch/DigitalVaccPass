import 'package:flutter/material.dart';
import 'about.dart';
import 'addvaccination.dart';
import 'family.dart';
import 'faq.dart';
import 'homeScreen/home.dart';
import 'main.dart';
import 'statistics.dart';
import 'qrcode.dart';
import 'utils/util.dart';

class MyDrawer extends StatelessWidget {

  static bool getDoctor(String email) {
    bool isDoctor = false;
    TestData.userListDb.forEach((element) {
      if (!isDoctor) {
        if (element.userEmail.compareTo(email) == 0) {
          if (element.userRole == Role.Doctor) {
            isDoctor = true;
          }
        }
      }
    });
    return isDoctor;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 90,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    "Impfpass",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(width: 10),
                  Image.asset("assets/images/vaccine.png",
                      width: 40, height: 40),
                ],
              ),
            ),
          ),
          Visibility(
            visible: getDoctor(LastUser.lastUser),
            child: ListTile(
              leading: Icon(Icons.insights_outlined,
                  color: Theme.of(context).accentColor),
              title: Text(
                'Statistiken',
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyStatisticPage()));
              },
            ),
          ),
          Visibility(
            visible: getDoctor(LastUser.lastUser),
            child: ListTile(
              leading: Icon(
                Icons.qr_code_scanner_outlined,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Impfung hinzufügen',
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyVaccinationAddPage()));
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_hospital_outlined,
                color: Theme.of(context).accentColor),
            title: Text(
              'Impfpass',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyHomeScreenPage(selectedTabIndex: 0)));
            },
          ),
          ListTile(
            leading: Icon(Icons.masks_outlined,
                color: Theme.of(context).accentColor),
            title: Text(
              'Testergebnisse',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => MyHomeScreenPage(selectedTabIndex: 1),
              ));
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.qr_code_scanner_outlined, color: Theme.of(context).accentColor),
          //   title: Text(
          //     'MyOnboardPage',
          //     style: Theme.of(context).textTheme.headline6,
          //   ),
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyOnboardPage()));
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.people_outline,
                color: Theme.of(context).accentColor),
            title: Text(
              'Familienübersicht',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyFamilyPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.qr_code_outlined,
                color: Theme.of(context).accentColor),
            title: Text(
              'Mein QR-Code',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyQRPage()));
            },
          ),
          ListTile(
            leading:
                Icon(Icons.quiz_outlined, color: Theme.of(context).accentColor),
            title: Text(
              'FAQ',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyFaqPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip_outlined,
                color: Theme.of(context).accentColor),
            title: Text(
              'Über uns',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyAboutPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Theme.of(context).accentColor),
            title: Text(
              'Logout',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
        ],
      ),
    );
  }
}
