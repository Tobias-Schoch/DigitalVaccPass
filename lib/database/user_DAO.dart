import 'package:digital_vac_pass/utils/user.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

final DatabaseHelper con = DatabaseHelper();

class UserDAO {

  static Future<int> create(String userName, String userEmail, String userPassword, Role userRole) async {
    final Database dbClient = await con.db;
    final insertUser = new User(userName, userEmail, userPassword, userRole);
    int id = await dbClient.insert(DatabaseHelper.userTable, insertUser.toMap());
    return id;
  }

  static Future<User> getUserByEmail(String userEmail) async {
    final Database dbClient = await con.db;
    List<Map> list = await dbClient.rawQuery("SELECT * FROM USER WHERE USER_EMAIL = ?", [userEmail]);
    if (list.isNotEmpty) {
      return User.fromMap(list[0]);
    } else {
      return null;
    }
  }

  static Future<bool> userLoginCheck(String userEmail, userPassword) async {
    final Database dbClient = await con.db;
    List<Map> list = await dbClient.rawQuery("SELECT USER_ID FROM USER WHERE USER_EMAIL = ? AND PASSWORD = ?", [userEmail, userPassword]);
    if (list.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}