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
  static const Color lightOrange = Color(0xffFFFACC);
  static const Color lightRed = Color(0xffFEC3C3);
  static const Color lightGreen = Color(0xffDEFFDB);
  static const Color primaryColor = Color(0xff5D5FEF);
  static const Color textColor = Color(0xff263238);
  static const Color backgroundTextColor = Color(0xffcbcbf3);
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
    User.withData('Luis Nothvogel', 't', 't', Role.normal, vaccinationListDb,
        testsListDb),
    User.withData(
        'Dr. Anna Mayer', 'a', 'a', Role.doctor, vaccinationListDb, testsListDb)
  ];

  /// family member
  static List<User> familyUserDb = [
    User.withData('test', 'test@test.de', 'pw', Role.normal, vaccinationListDb,
        testsListDb),
    User.withData('test1', 'test1@test.de', 'pw1', Role.normal,
        vaccinationListDb, testsListDb),
    User.withData('test2', 'test2@test.de', 'pw2', Role.normal,
        vaccinationListDb, testsListDb),
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
    Test('testName', 'testId', DateTime.parse(strDt), Status.pending,
        'testDescription'),
    Test('testName2', 'testId2', DateTime.parse(strDt), Status.good,
        'testDescription2'),
    Test('testName3', 'testId3', DateTime.parse(strDt), Status.bad,
        'testDescription3')
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
