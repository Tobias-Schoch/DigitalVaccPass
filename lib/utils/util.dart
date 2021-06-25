import 'dart:ui';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../aboutScreen/onboard.dart';
import '../utils/test.dart';
import '../utils/user.dart';
import '../utils/vaccination.dart';

/// Util
class Util {
  /// String to date
  static DateTime getDateTimeFromString(String dateTimeString) =>
      DateTime.parse(dateTimeString);

  /// Save and load shared preference and check if first start
  static Future<void> checkFirstSeen(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool _seen = prefs.getBool('firstStartabc') ?? false;
    if (!_seen) {
      await prefs.setBool('firstStartabc', true);
      await Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const OnBoardingPage()));
    }
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

/// logged in user defined
class LastUser {
  /// logged in user defined
  static String lastUser = '';
}

/// Data for testing
class TestData {
  /// user logins
  static List<User> userListDb = [
    User.withData(testsListDb, 't', 'Luis Nothvogel', 't', Role.normal,
        vaccinationListDb),
    User.withData(
        testsListDb, 'a', 'Dr. Anna Mayer', 'a', Role.doctor, vaccinationListDb)
  ];

  /// family member
  static List<User> familyUserDb = [
    User.withData(testsListDb, 'test@test.de', 'test', 'pw', Role.normal,
        vaccinationListDb),
    User.withData(testsListDb, 'test1@test.de', 'test1', 'pw1', Role.normal,
        vaccinationListDb),
    User.withData(testsListDb, 'test2@test.de', 'test2', 'pw2', Role.normal,
        vaccinationListDb),
  ];

  /// Example date
  static String strDt = '2021-05-28';

  /// test vaccinations
  static List<Vaccination> vaccinationListDb = [
    Vaccination(
        'covid', '0001', DateTime.parse(strDt), 'kekDoctor', 'beschreibung'),
    Vaccination(
        'covid2', '0002', DateTime.parse(strDt), 'kekDoctor2', 'beschreibung2'),
    Vaccination(
        'covid3', '0003', DateTime.parse(strDt), 'kekDoctor3', 'beschreibung3')
  ];

  /// example tests
  static List<Test> testsListDb = [
    Test(DateTime.parse(strDt), 'testDescription', 'testId', 'testName', Status.pending),
    Test(DateTime.parse(strDt), 'testDescription2', 'testId2', 'testName2', Status.good),
    Test(DateTime.parse(strDt), 'testDescription3', 'testId3', 'testName3', Status.bad),
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
          faker.date.dateTime(),
          faker.lorem.word(),
          faker.lorem.sentence(),
          faker.randomGenerator.decimal().toString(),
          faker.randomGenerator.element(Status.values),
          ));

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
