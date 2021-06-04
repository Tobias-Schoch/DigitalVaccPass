import 'package:digital_vac_pass/familyScreen/family.dart';
import 'package:digital_vac_pass/qrScreen/qrcode.dart';
import 'package:digital_vac_pass/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digital_vac_pass/aboutScreen/about.dart';
import 'package:digital_vac_pass/doctorScreen/addvaccination.dart';
import 'package:digital_vac_pass/aboutScreen/faq.dart';
import 'package:digital_vac_pass/qrScreen/qrScanner.dart';
import 'package:digital_vac_pass/homeScreen/home.dart';
import 'package:digital_vac_pass/main.dart';
import 'package:digital_vac_pass/doctorScreen/statistics.dart';

class MyDrawer extends StatelessWidget {

  final bool isVisible;

  MyDrawer({this.isVisible});

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
            visible: isVisible,
            child: ListTile(
              leading: Icon(Icons.insights_outlined),
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
            visible: isVisible,
            child: ListTile(
              leading: Icon(Icons.qr_code_scanner_outlined),
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
          Visibility(
            visible: isVisible,
            child: Divider(
              thickness: 3.0,
              color: PredefinedColors.primaryColor,
              endIndent: 20.0,
              indent: 15.0,
              height: 40,
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_hospital_outlined),
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
            leading: Icon(
              Icons.masks_outlined,
            ),
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
          //   leading: Icon(Icons.qr_code_scanner_outlined),
          //   title: Text(
          //     'MyOnboardPage',
          //     style: Theme.of(context).textTheme.headline6,
          //   ),
          //   onTap: () {
          //     Navigator.of(context).push(
          //         MaterialPageRoute(builder: (context) => MyOnboardPage()));
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.people_outline),
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
            leading: Icon(Icons.qr_code_outlined),
            title: Text(
              'Mein QR-Code',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyQRPage()));
            },
          ),
          Divider(
            thickness: 3.0,
            color: PredefinedColors.primaryColor,
            endIndent: 20.0,
            indent: 15.0,
            height: 40,
          ),
          ListTile(
            leading: Icon(Icons.help_center_outlined),
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
            leading: Icon(Icons.privacy_tip_outlined),
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
            leading: Icon(Icons.logout),
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
