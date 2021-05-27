import 'package:digital_vac_pass/homeScreen/home.dart';
import 'package:digital_vac_pass/qrcode.dart';
import 'package:digital_vac_pass/statistics.dart';
import 'package:digital_vac_pass/homeScreen/testresult.dart';
import 'package:digital_vac_pass/homeScreen/vaccination.dart';
import 'package:flutter/material.dart';

import 'about.dart';
import 'addvaccination.dart';
import 'family.dart';
import 'faq.dart';
import 'main.dart';
import 'onboard.dart';
import 'qrcode.dart';
import 'login.dart';

class MyDrawer extends StatelessWidget {
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
                  Image.asset("images/vaccine.png", width: 40, height: 40),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_hospital_outlined),
            title: Text(
              'Impfpass',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomeScreenPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.insights_outlined),
            title: Text(
              'Statistiken',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyStatisticPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.qr_code_scanner_outlined),
            title: Text(
              'Impfung hinzufügen',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyVaccinationAddPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.qr_code_scanner_outlined),
            title: Text(
              'MyOnboardPage',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyOnboardPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.masks_outlined),
            title: Text(
              'Testergebnisse',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyTestPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people_outline),
            title: Text(
              'Familienübersicht',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyFamilyPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.qr_code_outlined),
            title: Text(
              'Mein QR-Code',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyQRPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.accessible),
            title: Text(
              'FAQ',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyFaqPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip_outlined),
            title: Text(
              'Über uns',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyAboutPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.login_rounded),
            title: Text(
              'Login',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyLoginPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
        ],
      ),
    );
  }
}
