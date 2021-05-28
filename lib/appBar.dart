import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
            child: Text(
              "Impfpass",
              style: Theme.of(context).textTheme.headline1,
            ),
        ),
        SizedBox(width: 15),
        Image.asset("assets/images/vaccine.png", width: 60, height: 60),
      ],
    );
  }
}
