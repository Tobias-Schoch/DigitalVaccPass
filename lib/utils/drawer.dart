import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../aboutScreen/about.dart';
import '../aboutScreen/faq.dart';
import '../doctorScreen/addvaccination.dart';
import '../doctorScreen/statistics.dart';
import '../familyScreen/family.dart';
import '../homeScreen/home.dart';
import '../main.dart';
import '../qrScreen/qrcode.dart';
import '../utils/util.dart';

/// Drawer
class MyDrawer extends StatelessWidget {
  /// Drawer
  const MyDrawer({Key key, this.isVisible}) : super(key: key);
  final bool isVisible;

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 90,
              child: DrawerHeader(
                decoration: const BoxDecoration(
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
                leading: const Icon(
                  Icons.insights_outlined,
                  color: PredefinedColors.textColor,
                ),
                title: Text(
                  'Statistiken',
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MyStatisticPage()));
                },
              ),
            ),
            Visibility(
              visible: isVisible,
              child: ListTile(
                leading: const Icon(Icons.qr_code_scanner_outlined,
                    color: PredefinedColors.textColor),
                title: Text(
                  'Impfung hinzufügen',
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MyVaccinationAddPage()));
                },
              ),
            ),
            Visibility(
              visible: isVisible,
              child: const Divider(
                thickness: 3,
                color: PredefinedColors.primaryColor,
                endIndent: 20,
                indent: 15,
                height: 40,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.local_hospital_outlined,
                  color: PredefinedColors.textColor),
              title: Text(
                'Impfpass',
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        MyHomeScreenPage(selectedTabIndex: 0)));
              },
            ),
            ListTile(
              leading: const Icon(Icons.masks_outlined,
                  color: PredefinedColors.textColor),
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
              leading: const Icon(Icons.people_outline,
                  color: PredefinedColors.textColor),
              title: Text(
                'Familienübersicht',
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyFamilyPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.qr_code_outlined,
                  color: PredefinedColors.textColor),
              title: Text(
                'Mein QR-Code',
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MyQRPage()));
              },
            ),
            const Divider(
              thickness: 3,
              color: PredefinedColors.primaryColor,
              endIndent: 20,
              indent: 15,
              height: 40,
            ),
            ListTile(
              leading: const Icon(Icons.help_center_outlined,
                  color: PredefinedColors.textColor),
              title: Text(
                'FAQ',
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MyFaqPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip_outlined,
                  color: PredefinedColors.textColor),
              title: Text(
                'Über uns',
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyAboutPage()));
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.logout, color: PredefinedColors.textColor),
              title: Text(
                'Logout',
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MyApp()));
              },
            ),
          ],
        ),
      );
}
