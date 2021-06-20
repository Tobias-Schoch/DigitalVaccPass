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

enum Status { good, bad, pending }