import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/customWidgets.dart';
import '../utils/util.dart';

class MyTestPage extends StatefulWidget {
  MyTestPage({Key key, this.title, this.selectedUser, this.isFloatingActionButtonVisible}) : super(key: key);

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
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.selectedUser.userName,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center),
            SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.selectedUser.tests.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
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
                            children: [
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 18),
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
                                        children: [
                                          SizedBox(height: 10),
                                          Text('Datum.: ' +
                                              DateFormat('dd.MM.yyyy').format(
                                                  widget.selectedUser.tests
                                                      .elementAt(index)
                                                      .testDate)),
                                          SizedBox(height: 8),
                                          Text('Test-ID: ' +
                                              widget.selectedUser.tests
                                                  .elementAt(index)
                                                  .testId),
                                          SizedBox(height: 8),
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
                                          SizedBox(height: 18),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: myVisibleFloatingActionButton(context, widget.isFloatingActionButtonVisible),
    );
  }
}
