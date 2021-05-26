import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "Impfpass",
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(width: 10),
        Image.asset("images/vaccine.png", width: 40, height: 40),
      ],
    );
  }
}
