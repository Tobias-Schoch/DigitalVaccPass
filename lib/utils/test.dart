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
  Test(this.testDate, this.testDescription, this.testIdNr, this.testName,
      this.testStatus);

  /// Single test without state
  Test.newlyWithoutStatus(
      this.testDate, this.testDescription, this.testIdNr, this.testName)
      : testStatus = Status.pending;

  /// Test for today
  Test.newlyToday(
    this.testDescription,
    this.testIdNr,
    this.testName,
    this.testStatus,
  ) : testDate = DateTime.now();

  /// Test for today without state
  Test.newlyTodayWithoutStatus(
      this.testDescription, this.testIdNr, this.testName)
      : testDate = DateTime.now(),
        testStatus = Status.pending;

  /// Test database
  Test.forDb(
    this.familyId,
    this.testDate,
    this.testDescription,
    this.testIdNr,
    this.testName,
    this.testStatus,
    this.userId,
  );

  /// Map test
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['FAMILY_ID'] = familyId;
    map['TEST_DATE'] = testDate.toString();
    map['TEST_DESCRIPTION'] = testDescription;
    map['TEST_ID_NR'] = testIdNr;
    map['TEST_NAME'] = testName;
    map['TEST_STATUS'] = testStatus.toString();
    map['USER_ID'] = userId;
    return map;
  }

  /// Get test from map
  factory Test.fromMap(Map<String, dynamic> data) => Test.forDb(
      data['FAMILY_ID'],
      Util.getDateTimeFromString(data['TEST_DATE']),
      data['TEST_DESCRIPTION'],
      data['TEST_ID_NR'],
      data['TEST_NAME'],
      getStatusFromString(data['TEST_STATUS']),
      data['USER_ID']);

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
