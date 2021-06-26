import 'package:sqflite/sqflite.dart';

import '../utils/user.dart';
import 'database_helper.dart';

/// DatabaseHelper
final DatabaseHelper con = DatabaseHelper();

/// UserDAO
class UserDAO {
  /// Create User
  static Future<int> create(String userName, String userEmail,
      String userPassword, Role userRole) async {
    final Database dbClient = await con.db;
    final User insertUser = User(userName, userEmail, userPassword, userRole);
    final int id =
        await dbClient.insert(DatabaseHelper.userTable, insertUser.toMap());
    return id;
  }

  /// Get type User by email
  static Future<User> getUserByEmail(String userEmail) async {
    final Database dbClient = await con.db;
    final List<Map<String, Object>> list = await dbClient.query(
        DatabaseHelper.userTable, where: 'USER_EMAIL = ?', whereArgs: [userEmail]);
    if (list.isNotEmpty) {
      return User.fromMap(list[0]);
    } else {
      return null;
    }
  }

  /// Check if mail password combination is right
  static Future<bool> userLoginCheck(
      String userEmail, String userPassword) async {
    final Database dbClient = await con.db;
    final List<Map<String, Object>> list = await dbClient.query(
        DatabaseHelper.userTable, where: 'USER_EMAIL = ? AND PASSWORD = ?', whereArgs: [userEmail, userPassword]);
    if (list.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
