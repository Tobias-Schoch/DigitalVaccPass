import 'dart:ui';

class Vaccination {
  String vaccinationName;
  String chargeNr;
  DateTime vaccinationDate;
  String doctorSignature;
  String vaccinationDescription;

  Vaccination(this.vaccinationName, this.chargeNr, this.vaccinationDate, this.doctorSignature, this.vaccinationDescription);

  Vaccination.today(this.vaccinationName, this.chargeNr, this.doctorSignature, this.vaccinationDescription) : vaccinationDate = DateTime.now();
}

class Test {
  String testName;
  String testId;
  DateTime testDate;
  Status testStatus;
  String testDescription;

  Test(this.testName, this.testId, this.testDate, this.testStatus, this.testDescription);

  Test.newlyWithoutStatus(this.testName, this.testId, this.testDate, this.testDescription) : testStatus = Status.Pending;

  Test.newlyToday(this.testName, this.testId, this.testStatus, this.testDescription) : testDate = DateTime.now();

  Test.newlyTodayWithoutStatus(this.testName, this.testId, this.testDescription) : testDate = DateTime.now(), testStatus = Status.Pending;
}

class User {
  String userName;
  String userEmail;
  String userPassword;
  Role userRole;

  static User loggedInUser;

  User(this.userName, this.userEmail, this.userPassword, this.userRole);
}

class PredefinedColors {
  static const lightOrange = const Color(0xffFFFACC);
  static const lightRed = const Color(0xffFEC3C3);
  static const lightGreen = const Color(0xffDEFFDB);
  static const primaryColor = const Color(0xff5D5FEF);
  static const textColor = const Color(0xff263238);
  static const accentWhite = const Color(0xfffafafa);
}

class TestData {
  static List<User> userListDb = [
    new User('Max Mustermann', 'max@test.de', '123', Role.Normal),
    new User('Moritz Mustermann', 'moritz@test.de', '1234', Role.Doctor),
    new User('T', 't', '1', Role.Normal)
  ];

  static User getMatchingUser(String email, String pw) {
    User matchingUser;
    userListDb.forEach((element) {
      if (matchingUser == null && element.userEmail.compareTo(email) == 0 &&
          element.userPassword.compareTo(pw) == 0) {
        matchingUser = element;
      }
    });
    return matchingUser;
  }
}

enum Login {
  NotLoggedIn,
  LoggedIn
}

enum Role {
  Normal,
  Doctor
}

enum Status {
  Good,
  Bad,
  Pending
}