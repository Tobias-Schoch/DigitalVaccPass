import '../utils/util.dart';

class Test {
  String testName;
  String testIdNr;
  DateTime testDate;
  Status testStatus;
  String testDescription;

  int userId;
  int familyId;

  Test(this.testName, this.testIdNr, this.testDate, this.testStatus,
      this.testDescription);

  Test.newlyWithoutStatus(
      this.testName, this.testIdNr, this.testDate, this.testDescription)
      : testStatus = Status.pending;

  Test.newlyToday(
      this.testName, this.testIdNr, this.testStatus, this.testDescription)
      : testDate = DateTime.now();

  Test.newlyTodayWithoutStatus(
      this.testName, this.testIdNr, this.testDescription)
      : testDate = DateTime.now(),
        testStatus = Status.pending;

  Test.forDb(this.testName, this.testIdNr, this.testDate, this.testStatus,
      this.testDescription, this.userId, this.familyId);

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['TEST_NAME'] = testName;
    map['TEST_ID_NR'] = testIdNr;
    map['TEST_DATE'] = testDate.toString();
    map['TEST_STATUS'] = testStatus.toString();
    map['TEST_DESCRIPTION'] = testDescription;
    map['USER_ID'] = userId;
    map['FAMILY_ID'] = familyId;
    return map;
  }

  factory Test.fromMap(Map<String, dynamic> data) => Test.forDb(
      data['TEST_NAME'],
      data['TEST_ID_NR'],
      Util.getDateTimeFromString(data['TEST_DATE']),
      getStatusFromString(data['TEST_STATUS']),
      data['TEST_DESCRIPTION'],
      data['USER_ID'],
      data['FAMILY_ID']);

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

enum Status { good, bad, pending }
