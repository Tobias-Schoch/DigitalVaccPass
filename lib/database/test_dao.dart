import 'package:sqflite/sqflite.dart';

import '../utils/test.dart';
import 'database_helper.dart';

/// DatabaseHelper
final DatabaseHelper con = DatabaseHelper();

/// TestDAO
class TestDAO {
  /// Add test
  static Future<int> create(
      String testName,
      String testIdNr,
      DateTime testDate,
      Status testStatus,
      String testDescription,
      int userId,
      int familyId) async {
    final Database dbClient = await con.db;
    final Test insertTest = Test.forDb(testName, testIdNr, testDate, testStatus,
        testDescription, userId, familyId);
    final int id =
        await dbClient.insert(DatabaseHelper.testsTable, insertTest.toMap());
    return id;
  }

  /// Get all tests for current user
  static Future<List<Test>> getAllTestsForUser(int userId) async {
    final Database dbClient = await con.db;
    final List<Map<String, Object>> list = await dbClient.query(
        DatabaseHelper.testsTable, where: 'USER_ID = ?', whereArgs: [userId], orderBy: 'TEST_DATE DESC');

    final List<Test> testList = list.isNotEmpty
        ? list.map((Map<String, Object> e) => Test.fromMap(e)).toList()
        : List<Test>.empty();

    return testList;
  }

  /// Get all tests for specific family member
  static Future<List<Test>> getAllTestsForFamilyUser(int familyId) async {
    final Database dbClient = await con.db;
    final List<Map<String, Object>> list = await dbClient.query(
        DatabaseHelper.testsTable, where: 'FAMILY_ID = ?', whereArgs: [familyId]);

    final List<Test> vaccList = list.isNotEmpty
        ? list.map((Map<String, Object> e) => Test.fromMap(e)).toList()
        : List<Test>.empty();

    return vaccList;
  }
}
