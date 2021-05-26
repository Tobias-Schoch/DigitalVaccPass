import 'package:digital_vac_pass/qrcode.dart';
import 'package:digital_vac_pass/testresult.dart';
import 'package:flutter/material.dart';

import 'about.dart';
import 'family.dart';
import 'faq.dart';
import 'main.dart';
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
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
            leading: Icon(Icons.qr_code_2_outlined),
            title: Text(
              'Mein QR-Code',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyQRPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.quiz_outlined),
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
            leading: Icon(Icons.logout_rounded),
            title: Text(
              'Logout',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyLoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
