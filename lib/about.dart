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
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "About",
              style: Theme.of(context).textTheme.headline4,
            ),
            Card(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                      title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 18),
                            Text("Digitaler Impfpass", style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.left),
                          ]
                      ),
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
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
