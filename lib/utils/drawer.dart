import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../aboutScreen/about.dart';
import '../aboutScreen/faq.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../doctorScreen/addvaccination.dart';
import '../doctorScreen/statistics.dart';
import '../familyScreen/family.dart';
import '../homeScreen/home.dart';
import '../main.dart';
import '../qrScreen/qrcode.dart';

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
                      AppLocalizations.of(context).vaccPass,
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
                  color: Theme.of(context).primaryColorLight,
                ),
                title: Text(
                  AppLocalizations.of(context).statistics,
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
                leading: Icon(Icons.qr_code_scanner_outlined,
                    color: Theme.of(context).primaryColorLight),
                title: Text(
                  AppLocalizations.of(context).addVaccine,
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
              child: Divider(
                thickness: 3,
                color: Theme.of(context).accentColor,
                endIndent: 20,
                indent: 15,
                height: 40,
              ),
            ),
            ListTile(
              leading: Icon(Icons.local_hospital_outlined,
                  color: Theme.of(context).primaryColorLight),
              title: Text(
                AppLocalizations.of(context).vaccPass,
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyHomeScreenPage(selectedTabIndex: 0)));
              },
            ),
            ListTile(
              leading: Icon(Icons.masks_outlined,
                  color: Theme.of(context).primaryColorLight),
              title: Text(
                AppLocalizations.of(context).testresults,
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyHomeScreenPage(selectedTabIndex: 1)));
              },
            ),
            ListTile(
              leading: Icon(Icons.people_outline,
                  color: Theme.of(context).primaryColorLight),
              title: Text(
                AppLocalizations.of(context).familyOverview,
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyFamilyPage()));
              },
            ),
            ListTile(
              leading:  Icon(Icons.qr_code_outlined,
                  color: Theme.of(context).primaryColorLight),
              title: Text(
                AppLocalizations.of(context).myQRCode,
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyQRPage()));
              },
            ),
            Divider(
              thickness: 3,
              color: Theme.of(context).accentColor,
              endIndent: 20,
              indent: 15,
              height: 40,
            ),
            ListTile(
              leading: Icon(Icons.help_center_outlined,
                  color: Theme.of(context).primaryColorLight),
              title: Text(
                AppLocalizations.of(context).fAQ,
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyFaqPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip_outlined,
                  color: Theme.of(context).primaryColorLight),
              title: Text(
                AppLocalizations.of(context).aboutUs,
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyAboutPage()));
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.logout, color: Theme.of(context).primaryColorLight),
              title: Text(
                AppLocalizations.of(context).logout,
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyApp()));
              },
            ),
          ],
        ),
      );
}
