import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../database/user_dao.dart';
import '../doctorScreen/statistics.dart';
import '../homeScreen/home.dart';
import '../loginScreen/forgotpassword.dart';
import '../loginScreen/register.dart';
import '../utils/app_bar.dart';
import '../utils/user.dart';
import '../utils/util.dart';

/// Login page
class MyLoginPage extends StatefulWidget {
  /// Login page
  const MyLoginPage({Key key}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final TextEditingController myEmailTextController = TextEditingController();
  final TextEditingController myPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<bool> checkIfUserExists(String email, String pw) async {
    if (!_formKey.currentState.validate()) {
      return false;
    }
    final bool exists = await UserDAO.userLoginCheck(email, pw);
    // TestData.userListDb.forEach((element) {
    //   if (!exists) {
    //     if (element.userEmail.compareTo(email) == 0 &&
    //         element.userPassword.compareTo(pw) == 0) {
    //       exists = true;
    //     }
    //   }
    // });
    return exists;
  }

  @override
  void dispose() {
    myEmailTextController.dispose();
    myPasswordController.dispose();
    super.dispose();
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
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(AppLocalizations.of(context).login,
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.left),
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
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value) {
                      if (value.isNotEmpty) {
                        return null;
                      } else {
                        return AppLocalizations.of(context).emailCantBeEmpty;
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: myPasswordController,
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
                      if (value.isNotEmpty) {
                        return null;
                      } else {
                        return AppLocalizations.of(context).passwordCantBeEmpty;
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                      primary: Theme.of(context).primaryColorLight,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const MyForgotPasswordPage()));
                    },
                    child: Row(
                      children: <Widget>[
                        Flexible(
                            child: Text(
                                AppLocalizations.of(context).forgotPassword)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(height: 60),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        if (await checkIfUserExists(
                            myEmailTextController.text.toLowerCase(),
                            myPasswordController.text)) {
                          // User.loggedInUser = TestData.getMatchingUser(
                          //     myEmailTextController.text.toLowerCase(),
                          //     myPasswordController.text);
                          User.loggedInUser = await UserDAO.getUserByEmail(
                              myEmailTextController.text.toLowerCase());
                          if (User.loggedInUser != null &&
                              User.loggedInUser.userRole == Role.doctor) {
                            await Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const MyStatisticPage()));
                          } else {
                            await Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    MyHomeScreenPage(selectedTabIndex: 0)));
                          }

                          LastUser.lastUser =
                              myEmailTextController.text.toLowerCase();
                        } else if (myEmailTextController.text.toLowerCase() !=
                                '' &&
                            myPasswordController.text != '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              width: 320,
                              duration: const Duration(milliseconds: 3000),
                              content: Container(
                                  height: 20,
                                  child: Center(
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .emailAndPwDontMatch,
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                          );
                        }
                      },
                      label: Flexible(
                          child: Text(AppLocalizations.of(context).login,
                              style: const TextStyle(fontSize: 20))),
                      icon: const Icon(Icons.login),
                    ),
                  ),
                  const SizedBox(height: 25),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(height: 60),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                        primary: const Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: Theme.of(context).accentColor,
                            width: 3,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const MyRegisterPage()));
                      },
                      label: Flexible(
                          child: Text(AppLocalizations.of(context).register,
                              style: Theme.of(context).textTheme.bodyText2)),
                      icon: Icon(
                        Icons.how_to_reg,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
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
        'myEmailTextController', myEmailTextController));
    properties.add(DiagnosticsProperty<TextEditingController>(
        'myPasswordController', myPasswordController));
  }
}
