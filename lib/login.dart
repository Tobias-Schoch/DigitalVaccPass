import 'package:digital_vac_pass/register.dart';
import 'package:digital_vac_pass/statistics.dart';
import 'package:flutter/material.dart';
import 'appBar.dart';
import 'drawer.dart';

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Login",
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.left),
              SizedBox(height: 25),
              new TextFormField(
                autofocus: true,
                cursorColor: textColor,
                decoration: new InputDecoration(
                  labelText: "E-Mail",
                  fillColor: primeColor,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(color: primeColor, width: 3.0,),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(color: textColor, width: 3.0,),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: primeColor, width: 3.0,)),
                  labelStyle: new TextStyle(color: textColor),
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "Emailfeld darf nicht leer sein.";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 25),
              new TextFormField(
                cursorColor: textColor,
                decoration: new InputDecoration(
                  labelText: "Passwort",
                  fillColor: primeColor,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(color: primeColor, width: 3.0,),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(color: textColor, width: 3.0,),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: primeColor, width: 3.0,)),
                  labelStyle: new TextStyle(color: textColor),
                ),
                obscureText: true,
                validator: (val) {
                  if (val.length <= 15) {
                    return "Passwort ist zu kurz.";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 25),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 16),
                  primary: textColor,
                ),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    const Text('Password vergessen?'),
                  ],
                ),
              ),

              SizedBox(height: 25),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 60),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    primary: primeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyStatisticPage()));
                  },
                  label: Text('Einloggen', style: new TextStyle(fontSize: 20)),
                  icon: Icon(Icons.login),
                ),
              ),
              SizedBox(height: 25),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 60),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    primary: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: primeColor, width: 3.0,),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyRegisterPage()));
                  },
                  label: Text('Registrieren', style: TextStyle(fontSize: 20, color: textColor)),
                  icon: Icon(Icons.pin, color: textColor,),
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
