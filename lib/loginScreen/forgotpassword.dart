import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/app_bar.dart';
import 'login.dart';

/// Forgot password
class MyForgotPasswordPage extends StatefulWidget {
  /// Forgot password
  const MyForgotPasswordPage({Key key}) : super(key: key);

  @override
  _MyForgotPasswordPageState createState() => _MyForgotPasswordPageState();
}

class _MyForgotPasswordPageState extends State<MyForgotPasswordPage> {
  @override
  void dispose() {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(AppLocalizations.of(context).resetPassword,
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.left),
                const SizedBox(height: 25),
                TextFormField(
                  autofocus: true,
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
                  validator: (String val) {
                    if (val.isEmpty) {
                      return AppLocalizations.of(context).emailCantBeEmpty;
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 25),
                ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(height: 60),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MyLoginPage()));
                    },
                    label: Flexible(
                        child: Text(
                          AppLocalizations.of(context).reset,
                      style: const TextStyle(fontSize: 20),
                      overflow: TextOverflow.clip,
                    )),
                    icon: const Icon(Icons.refresh),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      );
}
