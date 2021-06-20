import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

final DatabaseHelper con = DatabaseHelper();

class VaccinationDAO {
  static Future<int> create() async {
    final Database dbClient = await con.db;
    // final insertUser = new User(userName, userEmail, userPassword, userRole);
    // int id = await dbClient.insert(DatabaseHelper.userTable, insertUser.toMap());
    return 0;
  }
}