import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/app_bar.dart';
import '../utils/drawer.dart';

/// Informations about the app
class MyAboutPage extends StatefulWidget {
  /// Informations about the app
  const MyAboutPage({Key key}) : super(key: key);

  @override
  _MyAboutPageState createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
  @override
  void dispose() {
    super.dispose();
  }

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
              Text(
                AppLocalizations.of(context).aboutUs,
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 25),
              Card(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ListTile(
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 18),
                          Text(AppLocalizations.of(context).digitalVaccPass,
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left),
                        ]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        SizedBox(height: 10),
                        Text('Version 1.0', textAlign: TextAlign.left),
                        SizedBox(height: 2),
                        Text('© 2021 Luis Nothvogel & Tobias Schoch',
                            textAlign: TextAlign.left),
                        SizedBox(height: 18),
                      ],
                    ))
              ])),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
      drawer: const MyDrawer());
}
