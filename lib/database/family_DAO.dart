import 'package:digital_vac_pass/utils/user.dart';
import 'package:digital_vac_pass/utils/util.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

final DatabaseHelper con = DatabaseHelper();

class FamilyDAO {

  static Future<int> create(String familyMemberName, String familyMemberEmail) async {
    final Database dbClient = await con.db;
    final insertFamilyMember = new User.familyMemberWithoutId(familyMemberName, familyMemberEmail);
    int id = await dbClient.insert(DatabaseHelper.familyTable, insertFamilyMember.toFamilyMemberMap());
    return id;
  }

  static Future<List<User>> getAllFamilyMembers() async {
    final Database dbClient = await con.db;
    List<Map> list = await dbClient.rawQuery("SELECT * FROM " + DatabaseHelper.familyTable);

    List<User> familyMemberList = list.isNotEmpty
        ? list.map((e) => User.familyMemberFromMap(e)).toList()
        : List<User>.empty();

    return familyMemberList;
  }

}