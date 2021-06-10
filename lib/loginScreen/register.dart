import 'package:flutter/material.dart';
import '../loginScreen/login.dart';
import '../utils/util.dart';
import '../utils/appBar.dart';

class MyRegisterPage extends StatefulWidget {
  MyRegisterPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {

  final myPasswordTextController = TextEditingController();
  final myNameTextController = TextEditingController();
  final myEmailTextController = TextEditingController();

  final GlobalKey<FormState> _formRegisterKey = GlobalKey<FormState>();


  @override
  void dispose() {
    super.dispose();
    myPasswordTextController.dispose();
    myNameTextController.dispose();
    myEmailTextController.dispose();
  }

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
          child: Form(
            key: _formRegisterKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Registrierung",
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.left),
                SizedBox(height: 25),
                TextFormField(
                  controller: myNameTextController,
                  autofocus: true,
                  cursorColor: Theme.of(context).primaryColorLight,
                  decoration: InputDecoration(
                    labelText: "Vor- und Nachname",
                    fillColor: Theme.of(context).accentColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 3.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
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
                    labelStyle: TextStyle(color: Theme.of(context).primaryColorLight),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Can´t be empty!";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: myEmailTextController,
                  cursorColor: Theme.of(context).primaryColorLight,
                  decoration: InputDecoration(
                    labelText: "E-Mail",
                    fillColor: Theme.of(context).accentColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 3.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
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
                    labelStyle: TextStyle(color: Theme.of(context).primaryColorLight),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Emailfeld darf nicht leer sein.";
                    } else if (!value.contains('@')) {
                      return 'not a valid email';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: myPasswordTextController,
                  cursorColor: Theme.of(context).primaryColorLight,
                  decoration: InputDecoration(
                    labelText: "Passwort",
                    fillColor: Theme.of(context).accentColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 3.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
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
                    labelStyle: TextStyle(color: Theme.of(context).primaryColorLight),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Can´t be empty';
                    } else if (value.length < 8) {
                      return 'password too short, needs to be > 7';
                    } else if (!value.contains(RegExp(r'[0-9]'))) {
                      return 'password must contain a number';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 25),
                TextFormField(
                  cursorColor: Theme.of(context).primaryColorLight,
                  decoration: InputDecoration(
                    labelText: "Passwort wiederholen",
                    fillColor: Theme.of(context).accentColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 3.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
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
                    labelStyle: TextStyle(color: Theme.of(context).primaryColorLight),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (myPasswordTextController.value.text.compareTo(value) != 0 || value.isEmpty) {
                      return 'password not the same';
                    } else {
                      return null; 
                    }
                  },
                ),
                SizedBox(height: 25),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(height: 60),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (!_formRegisterKey.currentState.validate()) {
                        return;
                      }
                      TestData.userListDb.add(new User(myNameTextController.text, myEmailTextController.text, myPasswordTextController.text, Role.Normal));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyLoginPage()));
                    },
                    label: Flexible(
                      child: Text('Registrieren',
                          style: TextStyle(fontSize: 20)),
                    ),
                    icon: Icon(Icons.how_to_reg),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
