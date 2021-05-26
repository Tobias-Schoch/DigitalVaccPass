import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 90,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    "Impfpass",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(width: 10),
                  Image.asset("images/vaccine.png", width: 40, height: 40),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_hospital_outlined),
            title: Text(
              'Impfpass',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.masks_outlined),
            title: Text(
              'Testergebnisse',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.people_outline),
            title: Text(
              'Familienübersicht',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.qr_code_2_outlined),
            title: Text(
              'Mein QR-Code',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.quiz_outlined),
            title: Text(
              'FAQ',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip_outlined),
            title: Text(
              'Über uns',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text(
              'Logout',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
