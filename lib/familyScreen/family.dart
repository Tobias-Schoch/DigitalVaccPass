import 'package:digital_vac_pass/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../database/family_dao.dart';
import '../utils/app_bar.dart';
import '../utils/custom_widgets.dart';
import '../utils/drawer.dart';
import '../utils/user.dart';
import 'family_home_screen.dart';

/// Family overview
class MyFamilyPage extends StatefulWidget {
  /// Family overview
  const MyFamilyPage({Key key}) : super(key: key);

  @override
  _MyFamilyPageState createState() => _MyFamilyPageState();
}

class _MyFamilyPageState extends State<MyFamilyPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const MyHeader(),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.sort),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(AppLocalizations.of(context).familyOverview,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.left),
            const SizedBox(height: 25),
            Expanded(
              child: FutureBuilder<List<User>>(
                future: FamilyDAO.getAllFamilyMembers(),
                builder: (BuildContext context, AsyncSnapshot snapshot) =>
                    snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Dismissible(
                                    background: Container(
                                      color: Theme.of(context).accentColor,
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Icon(Icons.delete_sweep, color: Theme.of(context).primaryColor,),
                                    ),
                                    key: UniqueKey(),
                                    onDismissed: (DismissDirection direction) {
                                      setState(() {
                                        FamilyDAO.deleteFamilyMember(snapshot.data[index].familyDbId);
                                      });
                                    },
                                    direction: DismissDirection.endToStart,
                                    child: Column(
                                      children: <Widget>[
                                        Card(
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Column(
                                                  children: <Widget>[
                                                    const SizedBox(height: 18),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).push(MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                MyFamilyHomeScreenPage(
                                                                    selectedUser:
                                                                        snapshot
                                                                            .data[index])));
                                                      },
                                                      child: ListTile(
                                                        title: Text(
                                                          snapshot.data[index]
                                                              .userName,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 18),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    )),
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                PredefinedColors.primaryColor),
                          )),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          myVisibleFloatingActionButtonForQrScanner(context, true, 'FAMILY'),
      drawer: const MyDrawer());
}
