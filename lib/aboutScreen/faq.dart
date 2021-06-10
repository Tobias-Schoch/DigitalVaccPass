import 'package:flutter/material.dart';
import '../utils/appBar.dart';
import '../utils/drawer.dart';
import '../utils/util.dart';

class MyFaqPage extends StatefulWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
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
                'FAQ',
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
                          Text('Was passiert mit meinen Daten?',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left),
                        ]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        const Text(
                            'Datenschutz liegt uns sehr am Herzen, daher speichern wir keine Daten. Die Daten werden lediglich auf ihrem Handy gespeichert und können nur von Ihnen eingesehen werden.',
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
                          Text('Ist der Impfpass sicher?',
                              style: Theme.of(context).textTheme.bodyText1),
                        ]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        const SizedBox(height: 10),
                        Text(
                            'Ja, diese App wurde mit Professoren und Experten entwickelt, die sich extrem gut auskennen mit der Materie',
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
                          Text('Wie schnell sehe ich neue Impfungen?',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left),
                        ]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        const Text(
                            'Innerhalb weniger Sekunden nach Scannung des QR-Codes ist die Impfung durch den Arzt übertragen.',
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
      drawer: MyDrawer(
          isVisible: User.loggedInUser == null
              ? false
              : User.loggedInUser.userRole == Role.Doctor
                  ? true
                  : false),
    );
  }
}
