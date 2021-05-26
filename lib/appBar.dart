import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "Impfpass",
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(width: 15),
        Image.asset("images/vaccine.png", width: 60, height: 60),
      ],
    );
  }
}
