import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../aboutScreen/about.dart';
import '../aboutScreen/faq.dart';
import '../aboutScreen/streamsocket.dart';
import '../doctorScreen/addvaccination.dart';
import '../doctorScreen/statistics.dart';
import '../familyScreen/family.dart';
import '../homeScreen/home.dart';
import '../main.dart';
import '../qrScreen/qrcode.dart';
import '../utils/util.dart';

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
                    'Impfpass',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(width: 10),
                  Image.asset('assets/images/vaccine.png',
                      width: 40, height: 40),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isVisible,
            child: ListTile(
              leading: Icon(
                Icons.insights_outlined,
                color: PredefinedColors.textColor,
              ),
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
              leading: Icon(Icons.qr_code_scanner_outlined,
                  color: PredefinedColors.textColor),
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
            leading: Icon(Icons.local_hospital_outlined,
                color: PredefinedColors.textColor),
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
            leading:
                Icon(Icons.masks_outlined, color: PredefinedColors.textColor),
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
            leading:
                Icon(Icons.people_outline, color: PredefinedColors.textColor),
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
            leading:
                Icon(Icons.qr_code_outlined, color: PredefinedColors.textColor),
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
            leading: Icon(Icons.help_center_outlined,
                color: PredefinedColors.textColor),
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
                color: PredefinedColors.textColor),
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
            leading: Icon(Icons.logout, color: PredefinedColors.textColor),
            title: Text(
              'Logout',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.accessible, color: PredefinedColors.textColor),
            title: Text(
              'SocketTest',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StreamSocket()));
            },
          ),
        ],
      ),
    );
  }
}
