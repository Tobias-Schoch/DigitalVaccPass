import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../database/vaccination_dao.dart';
import '../hero_dialog/custom_rect_twin.dart';
import '../hero_dialog/hero_dialog_route.dart';
import '../hero_dialog/hero_widget.dart';
import '../utils/custom_widgets.dart';
import '../utils/user.dart';
import '../utils/util.dart';
import '../utils/vaccination.dart';

/// Vaccination overview
class MyVaccinationPage extends StatefulWidget {
  /// Vaccination overview
  const MyVaccinationPage(
      {Key key, this.selectedUser, this.isFloatingActionButtonVisible})
      : super(key: key);

  final User selectedUser;
  final bool isFloatingActionButtonVisible;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<User>('selectedUser_vaccination', selectedUser));
    properties.add(DiagnosticsProperty<bool>(
        'isFloatingActionButtonVisible_vaccination',
        isFloatingActionButtonVisible));
  }

  @override
  State<StatefulWidget> createState() => _MyVaccinationPage();
}

class _MyVaccinationPage extends State<MyVaccinationPage> {
  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> vaccinationNotEmpty() async {
    final List<Vaccination> vaccines = widget.isFloatingActionButtonVisible
        ? await VaccinationDAO.getAllVaccinesForUser(
            widget.selectedUser.userDbId)
        : await VaccinationDAO.getAllVaccinesForFamilyUser(
            widget.selectedUser.familyDbId);
    return Future<bool>.value(vaccines.isEmpty);
  }

  String qrData = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(widget.selectedUser.userName,
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.left),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () {},
                child: Hero(
                  tag: 'show-qr-hero',
                  createRectTween: (Rect begin, Rect end) =>
                      CustomRectTween(begin: begin, end: end),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(height: 60),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        sleep(const Duration(milliseconds: 50));
                        qrData = await Util.buildUserQrData();
                        await Navigator.of(context).push(HeroDialogRoute(
                          builder: (BuildContext context) => PopupCard(qrData),
                        ));
                      },
                      label: Text(AppLocalizations.of(context).myQRCode,
                          style: const TextStyle(fontSize: 20)),
                      icon: const Icon(Icons.qr_code),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: FutureBuilder<bool>(
                    future: vaccinationNotEmpty(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              PredefinedColors.primaryColor),
                        );
                      } else if (snapshot.data == true) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Visibility(
                                  visible: snapshot.data,
                                  child: Text(
                                      AppLocalizations.of(context)
                                          .noVaccinesAvailable,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24,
                                          color: PredefinedColors
                                              .backgroundTextColor))),
                            ]);
                      } else {
                        return FutureBuilder<List<Vaccination>>(
                          future: widget.isFloatingActionButtonVisible
                              ? VaccinationDAO.getAllVaccinesForUser(
                                  widget.selectedUser.userDbId)
                              : VaccinationDAO.getAllVaccinesForFamilyUser(
                                  widget.selectedUser.familyDbId),
                          builder: (BuildContext context,
                                  AsyncSnapshot snapshot) =>
                              snapshot.hasData
                                  ? ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                              InkWell(
                                                  child: Column(
                                        children: <Widget>[
                                          Card(
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
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .vaccinationName,
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyText1),
                                                            ]),
                                                        subtitle: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            const SizedBox(
                                                                height: 10),
                                                            Text(AppLocalizations.of(
                                                                        context)
                                                                    .date +
                                                                DateFormat(
                                                                        'dd.MM.yyyy')
                                                                    .format(snapshot
                                                                        .data[
                                                                            index]
                                                                        .vaccinationDate)),
                                                            const SizedBox(
                                                                height: 8),
                                                            Text(AppLocalizations.of(
                                                                        context)
                                                                    .chargeNr +
                                                                snapshot
                                                                    .data[index]
                                                                    .chargeNr),
                                                            const SizedBox(
                                                                height: 8),
                                                            Text(AppLocalizations.of(
                                                                        context)
                                                                    .doctor +
                                                                snapshot
                                                                    .data[index]
                                                                    .doctorSignature
                                                                    .toString()),
                                                            const SizedBox(
                                                                height: 18),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
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
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
        floatingActionButton: myVisibleFloatingActionButtonForQrScanner(
            context, widget.isFloatingActionButtonVisible, 'VACCINE'),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<String>('qrData', qrData));
  }
}
