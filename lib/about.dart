import 'package:digital_vac_pass/utils/util.dart';
import 'package:flutter/material.dart';
import 'utils/appBar.dart';
import 'utils/drawer.dart';

class MyAboutPage extends StatefulWidget {
  MyAboutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAboutPageState createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
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
                "About",
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
                              Text("Digitaler Impfpass",
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.left),
                            ]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text("Version 0.0.0.2", textAlign: TextAlign.left),
                            SizedBox(height: 2),
                            Text("© 2021 Luis Nothvogel & Tobias Schoch",
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
