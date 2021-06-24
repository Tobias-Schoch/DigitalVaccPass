import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../database/user_DAO.dart';
import '../loginScreen/login.dart';
import '../utils/app_bar.dart';
import '../utils/user.dart';

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
                      labelText: AppLocalizations.of(context).firstLastName,
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
                        return AppLocalizations.of(context).nameCantBeEmpty;
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
                      labelText: AppLocalizations.of(context).email,
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
                        return AppLocalizations.of(context).emailCantBeEmpty;
                      } else if (!value.contains('@')) {
                        return AppLocalizations.of(context).notAValidEmail;
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
                      labelText: AppLocalizations.of(context).password,
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
                        return AppLocalizations.of(context).passwordCantBeEmpty;
                      } else if (value.length < 8) {
                        return AppLocalizations.of(context).passwordErrLength;
                      } else if (!value.contains(RegExp(r'[0-9]'))) {
                        return AppLocalizations.of(context).passwordErrNumber;
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
                        return AppLocalizations.of(context).passwordErrDontMatch;
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
                        await UserDAO.create(myNameTextController.text, myEmailTextController.text, myPasswordTextController.text, Role.normal);
                        // TestData.userListDb.add(User(
                        //     myNameTextController.text,
                        //     myEmailTextController.text,
                        //     myPasswordTextController.text,
                        //     Role.normal));
                        await Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.size,
                                alignment: Alignment.bottomCenter,
                                child: const MyLoginPage()));
                      },
                      label: Flexible(
                        child: Text(AppLocalizations.of(context).register,
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
