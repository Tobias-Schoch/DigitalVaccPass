import 'package:digital_vac_pass/utils/util.dart';
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
                constraints: BoxConstraints.tightFor(height: 60, width: double.infinity),
                child: ElevatedButton(
                  child:
                      Text('Peter Knopf', style: Theme.of(context).textTheme.bodyText2),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Theme.of(context).accentColor, width: 3.0,),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 60, width: double.infinity),
                child: ElevatedButton(
                  child:
                  Text('Juliane Knopf', style: Theme.of(context).textTheme.bodyText2),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Theme.of(context).accentColor, width: 3.0,),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.qr_code_scanner),
        backgroundColor: Theme.of(context).accentColor,
      ),
      drawer: MyDrawer(isVisible: User.loggedInUser.userRole == Role.Doctor ? true : false),
    );
  }
}
