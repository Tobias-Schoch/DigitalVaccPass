import 'package:digital_vac_pass/database/user_DAO.dart';
import 'package:digital_vac_pass/utils/user.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../loginScreen/login.dart';
import '../utils/app_bar.dart';

/// Register page
class MyRegisterPage extends StatefulWidget {
  /// Register page
  const MyRegisterPage({Key key}) : super(key: key);

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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const MyHeader(),
          elevation: 0,
        ),
        body: Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formRegisterKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('Registrierung',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.left),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: myNameTextController,
                    autofocus: true,
                    cursorColor: Theme.of(context).primaryColorLight,
                    decoration: InputDecoration(
                      labelText: 'Vor- und Nachname',
                      fillColor: Theme.of(context).accentColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).accentColor,
                          width: 3,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                          width: 3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Theme.of(context).accentColor,
                            width: 3,
                          )),
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Can´t be empty!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: myEmailTextController,
                    cursorColor: Theme.of(context).primaryColorLight,
                    decoration: InputDecoration(
                      labelText: 'E-Mail',
                      fillColor: Theme.of(context).accentColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).accentColor,
                          width: 3,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                          width: 3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Theme.of(context).accentColor,
                            width: 3,
                          )),
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Emailfeld darf nicht leer sein.';
                      } else if (!value.contains('@')) {
                        return 'not a valid email';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: myPasswordTextController,
                    cursorColor: Theme.of(context).primaryColorLight,
                    decoration: InputDecoration(
                      labelText: 'Passwort',
                      fillColor: Theme.of(context).accentColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).accentColor,
                          width: 3,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                          width: 3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Theme.of(context).accentColor,
                            width: 3,
                          )),
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    ),
                    obscureText: true,
                    validator: (String value) {
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
                  const SizedBox(height: 25),
                  TextFormField(
                    cursorColor: Theme.of(context).primaryColorLight,
                    decoration: InputDecoration(
                      labelText: 'Passwort wiederholen',
                      fillColor: Theme.of(context).accentColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).accentColor,
                          width: 3,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                          width: 3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Theme.of(context).accentColor,
                            width: 3,
                          )),
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    ),
                    obscureText: true,
                    validator: (String value) {
                      if (myPasswordTextController.value.text
                                  .compareTo(value) !=
                              0 ||
                          value.isEmpty) {
                        return 'password not the same';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(height: 60),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        if (!_formRegisterKey.currentState.validate()) {
                          return;
                        }
                        UserDAO.create(myNameTextController.text, myEmailTextController.text, myPasswordTextController.text, Role.normal);
                        // TestData.userListDb.add(User(
                        //     myNameTextController.text,
                        //     myEmailTextController.text,
                        //     myPasswordTextController.text,
                        //     Role.normal));
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.size,
                                alignment: Alignment.bottomCenter,
                                child: const MyLoginPage()));
                      },
                      label: const Flexible(
                        child: const Text('Registrieren',
                            style: const TextStyle(fontSize: 20)),
                      ),
                      icon: const Icon(Icons.how_to_reg),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
