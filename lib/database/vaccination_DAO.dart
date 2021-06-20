import 'package:digital_vac_pass/utils/vaccination.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

final DatabaseHelper con = DatabaseHelper();

class VaccinationDAO {

  static Future<int> create(String vaccinationName, String chargeNr, DateTime vaccinationDate, String doctorSignature, String vaccinationDescription, int userId, int familyId) async {
    final Database dbClient = await con.db;
    final Vaccination insertVaccine = new Vaccination.forDb(vaccinationName, chargeNr, vaccinationDate, doctorSignature, vaccinationDescription, userId, familyId);
    int id = await dbClient.insert(DatabaseHelper.vaccinesTable, insertVaccine.toMap());
    return id;
  }

  static Future<List<Vaccination>> getAllVaccinesForUser(int userId) async {
    final Database dbClient = await con.db;
    final list = await dbClient.rawQuery("SELECT * FROM " + DatabaseHelper.vaccinesTable + " WHERE USER_ID = ?", [userId]);

    List<Vaccination> vaccList = list.isNotEmpty
      ? list.map((Map<String, Object> e) => Vaccination.fromMap(e)).toList()
        : List<Vaccination>.empty();

    return vaccList;
  }

  static Future<List<Vaccination>> getAllVaccinesForFamilyUser(int familyId) async {
    final Database dbClient = await con.db;
    List<Map> list = await dbClient.rawQuery("SELECT * FROM " + DatabaseHelper.vaccinesTable + " WHERE FAMILY_ID = ?", [familyId]);

    List<Vaccination> vaccList = list.isNotEmpty
        ? list.map((e) => Vaccination.fromMap(e)).toList()
        : List<Vaccination>.empty();

    return vaccList;
  }

}