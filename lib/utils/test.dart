import '../utils/util.dart';

/// Test
class Test {
  /// test name
  String testName;
  /// test ID
  String testIdNr;
  /// test date
  DateTime testDate;
  /// test status
  Status testStatus;
  /// test description
  String testDescription;
  /// User id
  int userId;
  /// Single Family member id
  int familyId;

  /// Single Test
  Test(this.testName, this.testIdNr, this.testDate, this.testStatus,
      this.testDescription);

  /// Single test without state
  Test.newlyWithoutStatus(
      this.testName, this.testIdNr, this.testDate, this.testDescription)
      : testStatus = Status.pending;

  /// Test for today
  Test.newlyToday(
      this.testName, this.testIdNr, this.testStatus, this.testDescription)
      : testDate = DateTime.now();

  /// Test for today without state
  Test.newlyTodayWithoutStatus(
      this.testName, this.testIdNr, this.testDescription)
      : testDate = DateTime.now(),
        testStatus = Status.pending;

  /// Test database
  Test.forDb(this.testName, this.testIdNr, this.testDate, this.testStatus,
      this.testDescription, this.userId, this.familyId);

  /// Map test
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['TEST_NAME'] = testName;
    map['TEST_ID_NR'] = testIdNr;
    map['TEST_DATE'] = testDate.toString();
    map['TEST_STATUS'] = testStatus.toString();
    map['TEST_DESCRIPTION'] = testDescription;
    map['USER_ID'] = userId;
    map['FAMILY_ID'] = familyId;
    return map;
  }

  /// Get test from map
  factory Test.fromMap(Map<String, dynamic> data) => Test.forDb(
      data['TEST_NAME'],
      data['TEST_ID_NR'],
      Util.getDateTimeFromString(data['TEST_DATE']),
      getStatusFromString(data['TEST_STATUS']),
      data['TEST_DESCRIPTION'],
      data['USER_ID'],
      data['FAMILY_ID']);

  /// Get status of test
  static Status getStatusFromString(String data) {
    switch (data) {
      case 'Status.good':
        return Status.good;
      case 'Status.bad':
        return Status.bad;
      default:
        return Status.pending;
    }
  }
}

/// enum for test result
enum Status { good, bad, pending }
