import 'dart:ui';
import 'package:faker/faker.dart';

/// Define vaccinations
class Vaccination {
  String vaccinationName;
  String chargeNr;
  DateTime vaccinationDate;
  String doctorSignature;
  String vaccinationDescription;

  Vaccination(this.vaccinationName, this.chargeNr, this.vaccinationDate,
      this.doctorSignature, this.vaccinationDescription);

  Vaccination.today(this.vaccinationName, this.chargeNr, this.doctorSignature,
      this.vaccinationDescription)
      : vaccinationDate = DateTime.now();
}

class Test {
  String testName;
  String testId;
  DateTime testDate;
  Status testStatus;
  String testDescription;

  Test(this.testName, this.testId, this.testDate, this.testStatus,
      this.testDescription);

  Test.newlyWithoutStatus(
      this.testName, this.testId, this.testDate, this.testDescription)
      : testStatus = Status.pending;

  Test.newlyToday(
      this.testName, this.testId, this.testStatus, this.testDescription)
      : testDate = DateTime.now();

  Test.newlyTodayWithoutStatus(this.testName, this.testId, this.testDescription)
      : testDate = DateTime.now(),
        testStatus = Status.pending;
}

class User {
  String userName;
  String userEmail;
  String userPassword;
  Role userRole;
  List<Vaccination> vaccinations;
  List<Test> tests;

  static User loggedInUser;

  User(this.userName, this.userEmail, this.userPassword, this.userRole);

  User.withData(this.userName, this.userEmail, this.userPassword, this.userRole,
      this.vaccinations, this.tests);
}

class PredefinedColors {
  static const lightOrange = const Color(0xffFFFACC);
  static const lightRed = const Color(0xffFEC3C3);
  static const lightGreen = const Color(0xffDEFFDB);
  static const primaryColor = const Color(0xff5D5FEF);
  static const textColor = const Color(0xff263238);
  static const accentWhite = const Color(0xfffafafa);
}

class LastUser {
  static String lastUser = "";
}

class TestData {
  static List<User> userListDb = [
    User.withData('Luis Nothvogel', 't', 't', Role.normal,
        vaccinationListDb, testsListDb),
    User.withData(
        'Dr. Anna Mayer', 'a', 'a', Role.doctor, vaccinationListDb, testsListDb)
  ];

  static List<User> familyUserDb = [
    User.withData('test', 'test@test.de', 'pw', Role.normal,
        vaccinationListDb, testsListDb),
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

  static List<Vaccination> generateVaccList(int size) {
    return List<Vaccination>.generate(size, (int i) {
      return Vaccination(
          faker.food.dish(),
          faker.randomGenerator.decimal().toString(),
          faker.date.dateTime(),
          faker.person.name(),
          faker.lorem.sentence());
    });
  }

  static List<Test> generateTestsList(int size) {
    return List<Test>.generate(size, (int i) {
      return Test(
          faker.lorem.word(),
          faker.randomGenerator.decimal().toString(),
          faker.date.dateTime(),
          faker.randomGenerator.element(Status.values),
          faker.lorem.sentence());
    });
  }

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

enum Login { notLoggedIn, loggedIn }

enum Role { normal, doctor }

enum Status { good, bad, pending }
