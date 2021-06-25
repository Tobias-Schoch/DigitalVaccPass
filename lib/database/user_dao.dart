import 'package:sqflite/sqflite.dart';

import '../utils/user.dart';
import 'database_helper.dart';

/// DatabaseHelper
final DatabaseHelper con = DatabaseHelper();

/// UserDAO
class UserDAO {
  static Future<int> create(String userName, String userEmail,
      String userPassword, Role userRole) async {
    final Database dbClient = await con.db;
    final insertUser = User(userName, userEmail, userPassword, userRole);
    final int id =
        await dbClient.insert(DatabaseHelper.userTable, insertUser.toMap());
    return id;
  }

  static Future<User> getUserByEmail(String userEmail) async {
    final Database dbClient = await con.db;
    final List<Map> list = await dbClient.rawQuery(
        'SELECT * FROM ' + DatabaseHelper.userTable + ' WHERE USER_EMAIL = ?',
        [userEmail]);
    if (list.isNotEmpty) {
      return User.fromMap(list[0]);
    } else {
      return null;
    }
  }

  static Future<bool> userLoginCheck(String userEmail, userPassword) async {
    final Database dbClient = await con.db;
    final List<Map> list = await dbClient.rawQuery(
        'SELECT USER_ID FROM ' +
            DatabaseHelper.userTable +
            ' WHERE USER_EMAIL = ? AND PASSWORD = ?',
        [userEmail, userPassword]);
    if (list.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
