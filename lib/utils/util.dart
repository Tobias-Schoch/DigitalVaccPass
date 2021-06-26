import 'dart:core';
import 'dart:ui';

import 'package:digital_vac_pass/database/test_dao.dart';
import 'package:digital_vac_pass/database/vaccination_dao.dart';
import 'package:digital_vac_pass/utils/statistic.dart';
import 'package:digital_vac_pass/utils/vaccination.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../aboutScreen/onboard.dart';
import '../utils/test.dart';
import '../utils/user.dart';

/// Util
class Util {
  /// String to date
  static DateTime getDateTimeFromString(String dateTimeString) =>
      DateTime.parse(dateTimeString);

  /// Save and load shared preference and check if first start
  static Future<void> checkFirstSeen(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool _seen = prefs.getBool('firstStarterd') ?? false;
    if (!_seen) {
      await prefs.setBool('firstStarterd', true);
      await Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const OnBoardingPage()));
    }
  }

  static Future<String> buildUserQrData() async {
    String qrData = '';

    if (User.loggedInUser != null) {
      final List<Vaccination> vaccList = await VaccinationDAO.getAllVaccinesForUser
        (User.loggedInUser.userDbId);
      final List<Test> testList = await TestDAO.getAllTestsForUser
        (User.loggedInUser.userDbId);
      qrData += "EMAIL: " + User.loggedInUser.userEmail + "0\r\n";
      qrData += "NAME: " + User.loggedInUser.userName + "1\r\n";

      if (testList.isNotEmpty) {
        qrData += "TESTS[";
        testList.forEach((element) {
          qrData += "TEST[";
          qrData += "NAME: " + element.testName.toString() + "\r\n";
          qrData += "IDNR: " + element.testIdNr.toString() + "\r\n";
          qrData += "DATE: " + element.testDate.toString() + "\r\n";
          qrData += "STATUS: " + element.testStatus.toString() + "\r\n";
          qrData += "DESCR: " + element.testDescription.toString() + "\r\n";
          qrData += "FAMILY_ID: " + element.familyId.toString() + "\r\n";
          qrData += "]";
        });
        qrData += "3]";
      }

      if (vaccList.isNotEmpty) {
        qrData += "VACCINES[";
        vaccList.forEach((element) {
          qrData += "VACCINE[";
          qrData += "NAME: " + element.vaccinationName.toString() + "\r\n";
          qrData += "CHARGENR: " + element.chargeNr.toString() + "\r\n";
          qrData += "DATE: " + element.vaccinationDate.toString() + "\r\n";
          qrData += "DOC: " + element.doctorSignature.toString() + "\r\n";
          qrData += "DESCR: " + element.vaccinationDescription.toString() + "\r\n";
          qrData += "]";
        });
        qrData += "4]";
      }

    }

    return qrData;
  }
}

/// All colors defined for this project
class PredefinedColors {
  /// Color for pending test
  static const Color lightOrange = Color(0xffFFFACC);

  /// Color for positive test
  static const Color lightRed = Color(0xffFEC3C3);

  /// Color for negative test
  static const Color lightGreen = Color(0xffDEFFDB);

  /// Primary color
  static const Color primaryColor = Color(0xff5D5FEF);

  /// Text color
  static const Color textColor = Color(0xff263238);

  /// Background text color if no vaccinations or tests are added
  static const Color backgroundTextColor = Color(0xffcbcbf3);

  /// Our specific White
  static const Color accentWhite = Color(0xfffafafa);
}

class GetDate {
  static String getYear() {
    final DateTime now = new DateTime.now();
    final DateFormat formatter = new DateFormat('yyyy');
    return formatter.format(now).toString();
  }
}

/// logged in user defined
class LastUser {
  /// logged in user defined
  static String lastUser = '';
}

/// Data for testing
class TestData {
  /// user logins
  static List<User> userListDb = [
    User.withData('Luis Nothvogel', 't', 't', Role.normal, vaccinationListDb,
        testsListDb),
    User.withData(
        'Dr. Anna Mayer', 'a', 'a', Role.doctor, vaccinationListDb, testsListDb),
    User.withData(
        'Dr. Tobias Schoch', 'c', 'c', Role.doctor, vaccinationListDb, testsListDb)
  ];

  /// family member
  static List<User> familyUserDb = [
    User.withData('Peter Müller', 'test@test.de', 'pw', Role.normal, vaccinationListDb,
        testsListDb),
    User.withData('Juliane Müller', 'test1@test.de', 'pw1', Role.normal,
        vaccinationListDb, testsListDb),
    User.withData('Leo Müller', 'test2@test.de', 'pw2', Role.normal,
        vaccinationListDb, testsListDb),
  ];

  /// Example date
  static String strDt = '2021-05-28';
  static String strDt2 = '2021-04-15';
  static String strDt3 = '2020-11-28';

  /// test vaccinations
  static List<Vaccination> vaccinationListDb = [
    Vaccination(
        'Covid-19 Biontech', '24356567', DateTime.parse(strDt), 'Dr. Anna Mayer', 'beschreibung'),
    Vaccination(
        'Covid-19 Biontech', '452343', DateTime.parse(strDt2), 'Dr. Anna Mayer', 'beschreibung2'),
    Vaccination(
        'Tetanus', '23423', DateTime.parse(strDt3), 'Dr. Jörg Schmidt', 'beschreibung3')
  ];

  /// example tests
  static List<Test> testsListDb = [
    Test('testName', 'testId', DateTime.parse(strDt), Status.pending,
        'testDescription'),
    Test('testName2', 'testId2', DateTime.parse(strDt), Status.good,
        'testDescription2'),
    Test('testName3', 'testId3', DateTime.parse(strDt), Status.bad,
        'testDescription3')
  ];

  /// example Statistics
  static List<Statistic> statisticListDb = [
    Statistic('Covid-19 Biontech', 3, 6, 2021),
    Statistic('Covid-19 Moderna', 6, 6, 2021),
    Statistic('Covid-19 Moderna', 6, 5, 2021)
  ];

  /// Generate data for vaccination list with faker
  static List<Vaccination> generateVaccList(
          int size) =>
      List<Vaccination>.generate(
          size,
          (int i) => Vaccination(
              faker.food.dish(),
              faker.randomGenerator.decimal().toString(),
              faker.date.dateTime(),
              faker.person.name(),
              faker.lorem.sentence()));

  /// Generate data for test list with faker
  static List<Test> generateTestsList(int size) => List<Test>.generate(
      size,
      (int i) => Test(
          faker.lorem.word(),
          faker.randomGenerator.decimal().toString(),
          faker.date.dateTime(),
          faker.randomGenerator.element(Status.values),
          faker.lorem.sentence()));

  /// Check if user is existing
  static User getMatchingUser(String email, String pw) {
    User matchingUser;
    for (final element in userListDb) {
      if (matchingUser == null &&
          element.userEmail.compareTo(email) == 0 &&
          element.userPassword.compareTo(pw) == 0) {
        matchingUser = element;
      }
    }
    return matchingUser;
  }
}
