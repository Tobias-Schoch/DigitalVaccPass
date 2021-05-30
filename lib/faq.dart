import 'package:digital_vac_pass/utils/util.dart';
import 'package:flutter/material.dart';
import 'utils/appBar.dart';
import 'utils/drawer.dart';

class MyFaqPage extends StatefulWidget {
  MyFaqPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyFaqPageState createState() => _MyFaqPageState();
}

class _MyFaqPageState extends State<MyFaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyHeader(),
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "FAQ",
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 25),
              Card(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    ListTile(
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 18),
                              Text("Was passiert mit meinen Daten?",
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.left),
                            ]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                                "Datenschutz liegt uns sehr am Herzen, daher speichern wir keine Daten. Die Daten werden lediglich auf ihrem Handy gespeichert und können nur von Ihnen eingesehen werden.",
                                textAlign: TextAlign.left),
                            SizedBox(height: 18),
                          ],
                        ))
                  ])),
              SizedBox(height: 20),
              Card(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    ListTile(
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 18),
                              Text("Ist der Impfpass sicher?",
                                  style: Theme.of(context).textTheme.bodyText1),
                            ]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                                "Ja, diese App wurde mit Professoren und Experten entwickelt, die sich extrem gut auskennen mit der Materie",
                                textAlign: TextAlign.left),
                            SizedBox(height: 18),
                          ],
                        ))
                  ])),
              SizedBox(height: 20),
              Card(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    ListTile(
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 18),
                              Text("Wie schnell sehe ich neue Impfungen?",
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.left),
                            ]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                                "Innerhalb weniger Sekunden nach Scannung des QR-Codes ist die Impfung durch den Arzt übertragen.",
                                textAlign: TextAlign.left),
                            SizedBox(height: 18),
                          ],
                        ))
                  ])),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(isVisible: User.loggedInUser.userRole == Role.Doctor ? true : false),
    );
  }
}
