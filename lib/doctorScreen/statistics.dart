import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../doctorScreen/addvaccination.dart';
import '../utils/app_bar.dart';
import '../utils/drawer.dart';
import '../utils/user.dart';
import '../utils/util.dart';

/// Statistics for doctor
class MyStatisticPage extends StatefulWidget {
  /// Statistics for doctor
  const MyStatisticPage({Key key}) : super(key: key);

  @override
  _MyStatisticPageState createState() => _MyStatisticPageState();
}

class _MyStatisticPageState extends State<MyStatisticPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Util.checkFirstSeen(context);
  }

  bool isDoctor = User.loggedInUser == null
      ? false
      : User.loggedInUser.userRole == Role.doctor
          ? true
          : false;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const MyHeader(),
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(AppLocalizations.of(context).statistic,
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.left),
              const SizedBox(height: 25),
              Card(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ListTile(
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 18),
                          Text(AppLocalizations.of(context).lastSevenDays,
                              style: Theme.of(context).textTheme.bodyText1),
                        ]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Text(AppLocalizations.of(context).vaccinations + ': 68',
                            textAlign: TextAlign.left),
                        const SizedBox(height: 8),
                        Text(AppLocalizations.of(context).tests + ': 149',
                            textAlign: TextAlign.left),
                        const SizedBox(height: 18),
                      ],
                    ))
              ])),
              const SizedBox(height: 20),
              Card(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ListTile(
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 18),
                          Text(AppLocalizations.of(context).lastThirtyDays,
                              style: Theme.of(context).textTheme.bodyText1),
                        ]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Text(AppLocalizations.of(context).vaccinations + ': 68',
                            textAlign: TextAlign.left),
                        const SizedBox(height: 8),
                        Text(AppLocalizations.of(context).tests + ': 149',
                            textAlign: TextAlign.left),
                        const SizedBox(height: 18),
                      ],
                    ))
              ])),
              const SizedBox(height: 20),
              Card(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ListTile(
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 18),
                          Text(AppLocalizations.of(context).overall,
                              style: Theme.of(context).textTheme.bodyText1),
                        ]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Text(AppLocalizations.of(context).vaccinations + ': 68',
                            textAlign: TextAlign.left),
                        const SizedBox(height: 8),
                        Text(AppLocalizations.of(context).tests + ': 149',
                            textAlign: TextAlign.left),
                        const SizedBox(height: 18),
                      ],
                    ))
              ])),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const MyVaccinationAddPage()));
        },
        backgroundColor: Theme.of(context).accentColor,
        child: const Icon(Icons.add),
      ),
      drawer: MyDrawer(isVisible: isDoctor));
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isDoctor', isDoctor));
  }
}
