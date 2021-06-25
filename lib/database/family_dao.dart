import 'package:sqflite/sqflite.dart';

import '../utils/user.dart';
import 'database_helper.dart';

/// DatabaseHelper Family
final DatabaseHelper con = DatabaseHelper();

/// FamilyDAO
class FamilyDAO {
  static Future<int> create(
      String familyMemberName, String familyMemberEmail) async {
    final Database dbClient = await con.db;
    final insertFamilyMember =
        User.familyMemberWithoutId(familyMemberName, familyMemberEmail);
    final int id = await dbClient.insert(
        DatabaseHelper.familyTable, insertFamilyMember.toFamilyMemberMap());
    return id;
  }

  static Future<List<User>> getAllFamilyMembers() async {
    final Database dbClient = await con.db;
    final List<Map> list =
        await dbClient.rawQuery('SELECT * FROM ' + DatabaseHelper.familyTable);

    final List<User> familyMemberList = list.isNotEmpty
        ? list.map((e) => User.familyMemberFromMap(e)).toList()
        : List<User>.empty();

    return familyMemberList;
  }
}
