import 'package:digital_vac_pass/database/statistic_dao.dart';
import 'package:digital_vac_pass/utils/statistic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../doctorScreen/addvaccination.dart';
import '../utils/app_bar.dart';
import '../utils/drawer.dart';
import '../utils/util.dart';

/// Statistics for doctor
class MyStatisticPage extends StatefulWidget {
  /// Statistics for doctor
  const MyStatisticPage({Key key}) : super(key: key);

  @override
  _MyStatisticPageState createState() => _MyStatisticPageState();
}

class _MyStatisticPageState extends State<MyStatisticPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Util.checkFirstSeen(context);
  }

  String _buildCardBody(List<Statistic> element) {
    String body = "";
    for (int i = 0; i < element.length; i++) {
      if (i == element.length - 1) {
        body += element[i].vaccineName + ": " + element[i].amount.toString();
      } else {
        body += element[i].vaccineName +
            ": " +
            element[i].amount.toString() +
            "\r\n";
      }
    }
    return body;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const MyHeader(),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.sort),
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
            Text(AppLocalizations.of(context).statistic,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.left),
            const SizedBox(height: 25),
            Expanded(
              child: FutureBuilder<List>(
                future: StatisticDAO.getStatisticsForYear(DateTime.now().year),
                builder: (context, snapshot) => snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) => Column(
                              children: [
                                Card(
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
                                                      DateFormat.MMMM()
                                                          .format(DateTime(
                                                              2021,
                                                              snapshot
                                                                  .data[index]
                                                                  .month))
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                  ]),
                                              subtitle: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    const SizedBox(height: 8),
                                                    Text(_buildCardBody(snapshot
                                                        .data[index]
                                                        .statistics)),
                                                    const SizedBox(height: 18),
                                                  ]),
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
                    : const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              PredefinedColors.primaryColor),
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const MyVaccinationAddPage()));
        },
        backgroundColor: Theme.of(context).accentColor,
        child: const Icon(Icons.add),
      ),
      drawer: const MyDrawer());
}
