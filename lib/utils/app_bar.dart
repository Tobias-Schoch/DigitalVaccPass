import 'package:flutter/material.dart';

/// Appbar
class MyHeader extends StatelessWidget {
  /// Appbar
  const MyHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Text(
              'Impfpass',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          const SizedBox(width: 15),
          Image.asset('assets/images/vaccine.png', width: 50, height: 50),
        ],
      );
}
