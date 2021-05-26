import 'package:flutter/material.dart';
import 'appBar.dart';
import 'drawer.dart';

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
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "About",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Card(
                margin: EdgeInsets.all(20),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                      title: Text(
                        "Digitaler Impfpass",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      subtitle: Column(
                        children: [
                          Text("Version 0.0.0.2", textAlign: TextAlign.left),
                          Text("© 2021 Luis Nothvogel & Tobias Schoch",
                              textAlign: TextAlign.left),
                        ],
                      ))
                ])),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
