import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../database/user_dao.dart';
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
  final TextEditingController myPasswordTextController =
      TextEditingController();
  final TextEditingController myNameTextController = TextEditingController();
  final TextEditingController myEmailTextController = TextEditingController();
  bool selectedDoctor = false;

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
                  Text(AppLocalizations.of(context).registration,
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
                        return AppLocalizations.of(context)
                            .passwordErrDontMatch;
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  Row(children: <Widget>[
                    Checkbox(
                      checkColor: Theme.of(context).primaryColor,
                      activeColor: Theme.of(context).accentColor,
                      value: selectedDoctor,
                      onChanged: (bool value) {
                        setState(() {
                          selectedDoctor =
                              selectedDoctor == true ? false : true;
                        });
                      },
                    ),
                    const SizedBox(width: 25),
                    Text(AppLocalizations.of(context).registerAsDoctor),
                  ]),
                  const SizedBox(height: 25),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(height: 60),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        if (!_formRegisterKey.currentState.validate()) {
                          return;
                        }
                        await UserDAO.create(
                            myNameTextController.text,
                            myEmailTextController.text,
                            myPasswordTextController.text,
                            selectedDoctor == true ? Role.doctor : Role.normal);
                        // TestData.userListDb.add(User(
                        //     myNameTextController.text,
                        //     myEmailTextController.text,
                        //     myPasswordTextController.text,
                        //     Role.normal));

                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const MyLoginPage()));
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextEditingController>(
        'myPasswordTextController_register', myPasswordTextController));
    properties.add(DiagnosticsProperty<TextEditingController>(
        'myNameTextController_register', myNameTextController));
    properties.add(DiagnosticsProperty<TextEditingController>(
        'myEmailTextController_register', myEmailTextController));
    properties.add(
        DiagnosticsProperty<bool>('selectedDoctor_register', selectedDoctor));
  }
}
