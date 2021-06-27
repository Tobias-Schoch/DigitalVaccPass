import 'dart:core';
import 'dart:ui';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../aboutScreen/onboard.dart';
import '../database/test_dao.dart';
import '../database/vaccination_dao.dart';
import '../utils/statistic.dart';
import '../utils/test.dart';
import '../utils/user.dart';
import '../utils/vaccination.dart';

/// Util
class Util {
  /// String to date
  static DateTime getDateTimeFromString(String dateTimeString) {
    if (dateTimeString != null) {
      DateTime date = DateTime.tryParse(dateTimeString);
      if (date == null) {
        date = DateFormat('yyyy-MM-dd hh:mm:ss.sss').parse(dateTimeString);
      }
      return date;
    }
    return DateTime.now();
  }

  /// Save and load shared preference and check if first start
  static Future<void> checkFirstSeen(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool _seen = prefs.getBool('firstStart') ?? false;
    if (!_seen) {
      await prefs.setBool('firstStart', true);
      await Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const OnBoardingPage()));
    }
  }

  /// Build QR Data from user
  static Future<String> buildUserQrData() async {
    String qrData = '';

    if (User.loggedInUser != null) {
      final List<Vaccination> vaccList =
          await VaccinationDAO.getAllVaccinesForUser(
              User.loggedInUser.userDbId);
      final List<Test> testList =
          await TestDAO.getAllTestsForUser(User.loggedInUser.userDbId);
      qrData += 'EMAIL: ${User.loggedInUser.userEmail} 0\n';
      qrData += 'NAME: ${User.loggedInUser.userName} 1\n';

      if (testList.isNotEmpty) {
        qrData += 'TESTS[\n';
        for (final element in testList) {
          qrData += 'TEST[\n';
          qrData += 'NAME: ${element.testName.toString()} \n';
          qrData += 'IDNR: ${element.testIdNr.toString()} \n';
          qrData += 'DATE: ${element.testDate.toString()} \n';
          qrData += 'STATUS: ${element.testStatus.toString()} \n';
          qrData += 'DESCR: ${element.testDescription.toString()} \n';
          qrData += 'FAMILY_ID: ${element.familyId.toString()} \n';
          qrData += ']\n';
        }
        qrData += '3]\n';
      }

      if (vaccList.isNotEmpty) {
        qrData += 'VACCINES[\n';
        for (final element in vaccList) {
          qrData += 'VACCINE[\n';
          qrData += 'NAME: ${element.vaccinationName.toString()}\n';
          qrData += 'CHARGENR: ${element.chargeNr.toString()}\n';
          qrData += 'DATE: ${element.vaccinationDate.toString()}\n';
          qrData += 'DOC: ${element.doctorSignature.toString()}\n';
          qrData += 'DESCR: ${element.vaccinationDescription.toString()}\n';
          qrData += ']\n';
        }
        qrData += '4]\n';
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

/// Get Date
class GetDate {
  /// Get Year
  static String getYear() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy');
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
    User.withData('Dr. Anna Mayer', 'a', 'a', Role.doctor, vaccinationListDb,
        testsListDb),
    User.withData('Dr. Tobias Schoch', 'c', 'c', Role.doctor, vaccinationListDb,
        testsListDb)
  ];

  /// family member
  static List<User> familyUserDb = [
    User.withData('Peter Müller', 'test@test.de', 'pw', Role.normal,
        vaccinationListDb, testsListDb),
    User.withData('Juliane Müller', 'test1@test.de', 'pw1', Role.normal,
        vaccinationListDb, testsListDb),
    User.withData('Leo Müller', 'test2@test.de', 'pw2', Role.normal,
        vaccinationListDb, testsListDb),
  ];

  /// Example date
  static String strDt = '2021-05-28';

  /// example vaccinations
  static List<Vaccination> vaccinationListDb = [
    Vaccination('Covid-19 Biontech', '24356567', DateTime.parse(strDt),
        'Dr. Anna Mayer', 'beschreibung'),
    Vaccination('Covid-19 Biontech', '452343', DateTime.parse(strDt),
        'Dr. Anna Mayer', 'beschreibung2'),
    Vaccination('Tetanus', '23423', DateTime.parse(strDt), 'Dr. Jörg Schmidt',
        'beschreibung3')
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
