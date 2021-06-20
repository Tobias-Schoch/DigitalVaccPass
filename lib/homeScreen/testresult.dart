import 'package:digital_vac_pass/database/test_DAO.dart';
import 'package:digital_vac_pass/utils/test.dart';
import 'package:digital_vac_pass/utils/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/custom_widgets.dart';
import '../utils/util.dart';

/// Test results
class MyTestPage extends StatefulWidget {
  /// Test results
  const MyTestPage(
      {Key key, this.selectedUser, this.isFloatingActionButtonVisible})
      : super(key: key);

  final User selectedUser;
  final bool isFloatingActionButtonVisible;

  @override
  _MyTestPageState createState() => _MyTestPageState();
}

class _MyTestPageState extends State<MyTestPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.selectedUser.userName,
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center),
              const SizedBox(height: 25),
              Expanded(
                child: FutureBuilder<List>(
                  future:
                      TestDAO.getAllTestsForUser(widget.selectedUser.userDbId),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? new ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) => Column(
                                  children: <Widget>[
                                    Card(
                                      color: snapshot.data[index]
                                                  .testStatus ==
                                              Status.pending
                                          ? PredefinedColors.lightOrange
                                          :snapshot.data[index]
                                                      .testStatus ==
                                                  Status.good
                                              ? PredefinedColors.lightGreen
                                              : PredefinedColors.lightRed,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Column(
                                              children: <Widget>[
                                                ListTile(
                                                  title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      const SizedBox(
                                                          height: 18),
                                                      Text(
                                                        snapshot.data[index]
                                                            .testName,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1,
                                                      ),
                                                    ],
                                                  ),
                                                  subtitle: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      const SizedBox(
                                                          height: 10),
                                                      Text('Datum.: ' +
                                                          DateFormat(
                                                                  'dd.MM.yyyy')
                                                              .format(snapshot.data[index]
                                                                  .testDate)),
                                                      const SizedBox(height: 8),
                                                      Text('Test-ID: ' +
                                                          snapshot.data[index]
                                                              .testIdNr),
                                                      const SizedBox(height: 8),
                                                      Text(snapshot.data[index]
                                                          .testStatus
                                                          .toString()
                                                          .substring(snapshot.data[index]
                                                                  .testStatus
                                                                  .toString()
                                                                  .indexOf(
                                                                      '.') +
                                                              1)),
                                                      const SizedBox(
                                                          height: 18),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ))
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: myVisibleFloatingActionButton(
            context, widget.isFloatingActionButtonVisible),
      );
}
