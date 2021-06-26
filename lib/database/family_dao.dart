import 'package:sqflite/sqflite.dart';

import '../utils/user.dart';
import 'database_helper.dart';

/// DatabaseHelper Family
final DatabaseHelper con = DatabaseHelper();

/// FamilyDAO
class FamilyDAO {
  /// Add new family member
  static Future<int> create(
      String familyMemberName, String familyMemberEmail) async {
    final Database dbClient = await con.db;
    final User insertFamilyMember =
        User.familyMemberWithoutId(familyMemberName, familyMemberEmail);
    final int id = await dbClient.insert(
        DatabaseHelper.familyTable, insertFamilyMember.toFamilyMemberMap());
    return id;
  }

  /// Get all family members
  static Future<List<User>> getAllFamilyMembers() async {
    final Database dbClient = await con.db;
    final List<Map<String, Object>> list =
        await dbClient.rawQuery('SELECT * FROM ${DatabaseHelper.familyTable}');

    final List<User> familyMemberList = list.isNotEmpty
        ? list.map((Map<String, Object> e) => User.familyMemberFromMap(e)).toList()
        : List<User>.empty();

    return familyMemberList;
  }

  /// Delete Family with Vaccines,Tests
  static Future<bool> deleteFamilyMember(int familyId) async {
    final Database dbClient = await con.db;

    int count = await dbClient.delete(DatabaseHelper.familyTable, where: "FAMILY_MEMBER_ID = ?", whereArgs: [familyId]);
    await dbClient.delete(DatabaseHelper.vaccinesTable, where: "FAMILY_ID = ?", whereArgs: [familyId]);
    await dbClient.delete(DatabaseHelper.testsTable, where: "FAMILY_ID = ?", whereArgs: [familyId]);

    if (count > 0) {
      return true;
    } else {
      return false;
    }
  }
}
