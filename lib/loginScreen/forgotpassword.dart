import 'package:flutter/material.dart';
import '../appBar.dart';
import 'login.dart';

class MyForgotPasswordPage extends StatefulWidget {
  MyForgotPasswordPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyForgotPasswordPageState createState() => _MyForgotPasswordPageState();
}

class _MyForgotPasswordPageState extends State<MyForgotPasswordPage> {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Passwort zurücksetzen",
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.left),
              SizedBox(height: 25),
              new TextFormField(
                autofocus: true,
                cursorColor: Theme.of(context).primaryColorLight,
                decoration: new InputDecoration(
                  labelText: "E-Mail",
                  fillColor: Theme.of(context).accentColor,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(
                      color: Theme.of(context).accentColor,
                      width: 3.0,
                    ),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(
                      color: Theme.of(context).primaryColorLight,
                      width: 3.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 3.0,
                      )),
                  labelStyle: new TextStyle(color: Theme.of(context).primaryColorLight),
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
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 60),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyLoginPage()));
                  },
                  label: Flexible(child: Text('Zurücksetzen', style: new TextStyle(fontSize: 20), overflow: TextOverflow.clip,)),
                  icon: Icon(Icons.accessible),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
