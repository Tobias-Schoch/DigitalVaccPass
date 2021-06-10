import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/customWidgets.dart';
import '../utils/util.dart';

class MyTestPage extends StatefulWidget {
  MyTestPage(
      {Key key,
      this.title,
      this.selectedUser,
      this.isFloatingActionButtonVisible})
      : super(key: key);

  final String title;
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
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: ListView.builder(
                  itemCount: widget.selectedUser.tests.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Card(
                          color: widget.selectedUser.tests
                                      .elementAt(index)
                                      .testStatus ==
                                  Status.Pending
                              ? PredefinedColors.lightOrange
                              : widget.selectedUser.tests
                                          .elementAt(index)
                                          .testStatus ==
                                      Status.Good
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
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const SizedBox(height: 18),
                                          Text(
                                            widget.selectedUser.tests
                                                .elementAt(index)
                                                .testName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const SizedBox(height: 10),
                                          Text('Datum.: ' +
                                              DateFormat('dd.MM.yyyy').format(
                                                  widget.selectedUser.tests
                                                      .elementAt(index)
                                                      .testDate)),
                                          const SizedBox(height: 8),
                                          Text('Test-ID: ' +
                                              widget.selectedUser.tests
                                                  .elementAt(index)
                                                  .testId),
                                          const SizedBox(height: 8),
                                          Text(widget.selectedUser.tests
                                              .elementAt(index)
                                              .testStatus
                                              .toString()
                                              .substring(widget
                                                      .selectedUser.tests
                                                      .elementAt(index)
                                                      .testStatus
                                                      .toString()
                                                      .indexOf('.') +
                                                  1)),
                                          const SizedBox(height: 18),
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
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: myVisibleFloatingActionButton(
          context, widget.isFloatingActionButtonVisible),
    );
  }
}
