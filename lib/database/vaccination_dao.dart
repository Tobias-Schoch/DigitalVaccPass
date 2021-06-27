import 'package:sqflite/sqflite.dart';

import '../utils/vaccination.dart';
import 'database_helper.dart';

/// DatabaseHelper
final DatabaseHelper con = DatabaseHelper();

/// VaccinationDAO
class VaccinationDAO {
  /// Add vaccination
  static Future<int> create(
      String vaccinationName,
      String chargeNr,
      DateTime vaccinationDate,
      String doctorSignature,
      String vaccinationDescription,
      int userId,
      int familyId) async {
    final Database dbClient = await con.db;
    if (vaccinationName != null &&
        vaccinationName.isNotEmpty &&
        chargeNr != null &&
        chargeNr.isNotEmpty) {
      final Vaccination insertVaccine = Vaccination.forDb(
          vaccinationName,
          chargeNr,
          vaccinationDate,
          doctorSignature,
          vaccinationDescription,
          userId,
          familyId);
      final int id = await dbClient.insert(
          DatabaseHelper.vaccinesTable, insertVaccine.toMap());
      return id;
    }
    return null;
  }

  static Future<int> createBatch(List<Vaccination> vaccList) async {
    final Database dbClient = await con.db;
    final Batch vaccBatch = dbClient.batch();
    for (int i = 0; i < vaccList.length; i++) {
      vaccBatch.insert(DatabaseHelper.vaccinesTable, vaccList.elementAt(i).toMap());
    }
    await vaccBatch.commit();
  }

  /// Get all vaccinations for specific user
  static Future<List<Vaccination>> getAllVaccinesForUser(int userId) async {
    final Database dbClient = await con.db;
    final List<Map<String, Object>> list = await dbClient.query(
        DatabaseHelper.vaccinesTable,
        where: 'USER_ID = ?',
        whereArgs: [userId],
        orderBy: 'VACCINE_DATE');

    final List<Vaccination> vaccList = list.isNotEmpty
        ? list.map((Map<String, Object> e) => Vaccination.fromMap(e)).toList()
        : List<Vaccination>.empty();

    return vaccList;
  }

  /// Get all vaccinations for specifiv family member
  static Future<List<Vaccination>> getAllVaccinesForFamilyUser(
      int familyId) async {
    final Database dbClient = await con.db;
    final List<Map<String, Object>> list = await dbClient.query(
        DatabaseHelper.vaccinesTable,
        where: 'FAMILY_ID = ?',
        whereArgs: [familyId]);

    final List<Vaccination> vaccList = list.isNotEmpty
        ? list.map((Map<String, Object> e) => Vaccination.fromMap(e)).toList()
        : List<Vaccination>.empty();

    return vaccList;
  }
}
