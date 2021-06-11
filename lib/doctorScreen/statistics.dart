import 'package:flutter/material.dart';
import '../doctorScreen/addvaccination.dart';
import '../utils/app_bar.dart';
import '../utils/drawer.dart';
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
              Text('Statistik',
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
                          Text('02.05.2021 - 09.05.2021',
                              style: Theme.of(context).textTheme.bodyText1),
                        ]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        const SizedBox(height: 10),
                        const Text('Impfungen: 68', textAlign: TextAlign.left),
                        const SizedBox(height: 8),
                        const Text('Corona Impfungen: 65',
                            textAlign: TextAlign.left),
                        const SizedBox(height: 8),
                        const Text('Corona Tests: 149',
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
                          Text('Mai bisher',
                              style: Theme.of(context).textTheme.bodyText1),
                        ]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        const SizedBox(height: 10),
                        const Text('Impfungen: 248', textAlign: TextAlign.left),
                        const SizedBox(height: 8),
                        const Text('Corona Impfungen: 230',
                            textAlign: TextAlign.left),
                        const SizedBox(height: 8),
                        const Text('Corona Tests: 1370',
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
                          Text('April',
                              style: Theme.of(context).textTheme.bodyText1),
                        ]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        const SizedBox(height: 10),
                        const Text('Impfungen: 735', textAlign: TextAlign.left),
                        const SizedBox(height: 8),
                        const Text('Corona Impfungen: 710',
                            textAlign: TextAlign.left),
                        const SizedBox(height: 8),
                        const Text('Corona Tests: 7299',
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
                          Text('2021 bisher',
                              style: Theme.of(context).textTheme.bodyText1),
                        ]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        const SizedBox(height: 10),
                        const Text('Impfungen: 1720',
                            textAlign: TextAlign.left),
                        const SizedBox(height: 8),
                        const Text('Corona Impfungen: 1599',
                            textAlign: TextAlign.left),
                        const SizedBox(height: 8),
                        const Text('Corona Tests: 14682',
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
              builder: (context) => const MyVaccinationAddPage()));
        },
        backgroundColor: Theme.of(context).accentColor,
        child: const Icon(Icons.qr_code_scanner),
      ),
      drawer: MyDrawer(isVisible: isDoctor));
}
