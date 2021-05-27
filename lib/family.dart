import 'package:flutter/material.dart';
import 'appBar.dart';
import 'drawer.dart';

class MyFamilyPage extends StatefulWidget {
  MyFamilyPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyFamilyPageState createState() => _MyFamilyPageState();
}

class _MyFamilyPageState extends State<MyFamilyPage> {
  @override
  Widget build(BuildContext context) {
    const primeColor = const Color(0xff5D5FEF);
    const textColor = const Color(0xff263238);
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
              Text("Familienübersicht",
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.left),
              SizedBox(height: 25),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 60, width: 1000),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    primary: primeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  label: Text('Hinzufügen', style: new TextStyle(fontSize: 20)),
                  icon: Icon(Icons.group_add),
                ),
              ),
              SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 60, width: 1000),
                child: ElevatedButton(
                  child:
                      const Text('Peter Knopf', style: TextStyle(fontSize: 20, color: textColor)),
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    primary: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: primeColor, width: 3.0,),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 60, width: 1000),
                child: ElevatedButton(
                  child:
                  const Text('Juliane Knopf', style: TextStyle(fontSize: 20, color: textColor)),
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    primary: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: primeColor, width: 3.0,),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
