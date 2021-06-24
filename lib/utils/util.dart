import 'dart:ui';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../aboutScreen/onboard.dart';
import '../utils/user.dart';
import '../utils/test.dart';
import '../utils/vaccination.dart';

class Util {
  static DateTime getDateTimeFromString(String dateTimeString) =>
      DateTime.parse(dateTimeString);

  static Future checkFirstSeen(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('firstStartabc') ?? false);
    if (!_seen) {
      prefs.setBool('firstStartabc', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => OnBoardingPage()));
    }
  }
}

class PredefinedColors {
  static const lightOrange = const Color(0xffFFFACC);
  static const lightRed = const Color(0xffFEC3C3);
  static const lightGreen = const Color(0xffDEFFDB);
  static const primaryColor = const Color(0xff5D5FEF);
  static const textColor = const Color(0xff263238);
  static const backgroundTextColor = const Color(0xffcbcbf3);
  static const accentWhite = const Color(0xfffafafa);
}

class LastUser {
  static String lastUser = '';
}

class TestData {
  static List<User> userListDb = [
    User.withData('Luis Nothvogel', 't', 't', Role.normal, vaccinationListDb,
        testsListDb),
    User.withData(
        'Dr. Anna Mayer', 'a', 'a', Role.doctor, vaccinationListDb, testsListDb)
  ];

  static List<User> familyUserDb = [
    User.withData('test', 'test@test.de', 'pw', Role.normal, vaccinationListDb,
        testsListDb),
    User.withData('test1', 'test1@test.de', 'pw1', Role.normal,
        vaccinationListDb, testsListDb),
    User.withData('test2', 'test2@test.de', 'pw2', Role.normal,
        vaccinationListDb, testsListDb),
  ];

  static String strDt = '2021-05-28';
  static List<Vaccination> vaccinationListDb = [
    Vaccination(
        'covid', '0001', DateTime.parse(strDt), 'kekDoctor', 'beschreibung'),
    Vaccination(
        'covid2', '0002', DateTime.parse(strDt), 'kekDoctor2', 'beschreibung2'),
    Vaccination(
        'covid3', '0003', DateTime.parse(strDt), 'kekDoctor3', 'beschreibung3')
  ];

  static List<Test> testsListDb = [
    Test('testName', 'testId', DateTime.parse(strDt), Status.pending,
        'testDescription'),
    Test('testName2', 'testId2', DateTime.parse(strDt), Status.good,
        'testDescription2'),
    Test('testName3', 'testId3', DateTime.parse(strDt), Status.bad,
        'testDescription3')
  ];

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

  static List<Test> generateTestsList(int size) => List<Test>.generate(
      size,
      (int i) => Test(
          faker.lorem.word(),
          faker.randomGenerator.decimal().toString(),
          faker.date.dateTime(),
          faker.randomGenerator.element(Status.values),
          faker.lorem.sentence()));

  static User getMatchingUser(String email, String pw) {
    User matchingUser;
    userListDb.forEach((element) {
      if (matchingUser == null &&
          element.userEmail.compareTo(email) == 0 &&
          element.userPassword.compareTo(pw) == 0) {
        matchingUser = element;
      }
    });
    return matchingUser;
  }
}
