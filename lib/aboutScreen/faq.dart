import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/app_bar.dart';
import '../utils/drawer.dart';

/// FAQ Page
class MyFaqPage extends StatefulWidget {
  /// FAQ Page
  const MyFaqPage({Key key}) : super(key: key);

  @override
  _MyFaqPageState createState() => _MyFaqPageState();
}

class _MyFaqPageState extends State<MyFaqPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const MyHeader(),
        leading: Builder(
          builder: (BuildContext context) => IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
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
                AppLocalizations.of(context).fAQ,
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
                          Text(
                              AppLocalizations.of(context)
                                  .fAQWhatHappensWithMyData,
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left),
                        ]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Text(AppLocalizations.of(context).fAQDataAnswer,
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
                          Text(AppLocalizations.of(context).fAQVaccPassSafe,
                              style: Theme.of(context).textTheme.bodyText1),
                        ]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Text(AppLocalizations.of(context).fAQVaccPassSafeAnswer,
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
                          Text(
                              AppLocalizations.of(context)
                                  .fAQOfficialTest,
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left),
                        ]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Text(AppLocalizations.of(context).fAQOfficialTestAnswer,
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
                              Text(
                                  AppLocalizations.of(context)
                                      .fAQHowFastCanISeeNewVaccines,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.left),
                            ]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 10),
                            Text(AppLocalizations.of(context).fAQHowFastAnswer,
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
      drawer: const MyDrawer());
}
