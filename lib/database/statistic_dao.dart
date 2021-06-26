import 'package:digital_vac_pass/utils/statistic.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

/// DatabaseHelper
final DatabaseHelper con = DatabaseHelper();

class StatisticDAO {

  static Future<int> create(String vaccineName, DateTime vaccineDate) async {
    final Database dbClient = await con.db;
    final List<Map<String, Object>> statisticFromDbList = await dbClient.query(DatabaseHelper.statisticTable, where: "VACCINE_NAME = ? AND MONTH = ? AND YEAR = ?", whereArgs: [vaccineName, vaccineDate.month, vaccineDate.year], limit: 1);

    final List<Statistic> statisticList = statisticFromDbList.isNotEmpty
        ? statisticFromDbList.map((Map<String, Object> e) => Statistic.fromMap(e)).toList()
        : List<Statistic>.empty();

    if (statisticList.isNotEmpty) {
      // update
      Map<String, Object> data = {"AMOUNT": statisticList.elementAt(0).amount + 1};
      return await dbClient.update(DatabaseHelper.statisticTable, data, where: "VACCINE_NAME = ? AND MONTH = ? AND YEAR = ?", whereArgs: [vaccineName, vaccineDate.month, vaccineDate.year]);
    } else {
      // insert
      final statisticToInsert = new Statistic(vaccineName, 1, vaccineDate.month, vaccineDate.year);
      return await dbClient.insert(DatabaseHelper.statisticTable, statisticToInsert.toMap());
    }
  }

  static Future<Map<int, List<Statistic>>> getStatisticsForYear(int year) async {
    final Database dbClient = await con.db;
    final List<Map<String, Object>> statisticsFromDbList = await dbClient.query(DatabaseHelper.statisticTable, where: "YEAR = ?", whereArgs: [year], orderBy: "MONTH desc");

    final List<Statistic> statisticList = statisticsFromDbList.isNotEmpty
        ? statisticsFromDbList.map((Map<String, Object> e) => Statistic.fromMap(e)).toList()
        : List<Statistic>.empty();

    if (statisticList.isNotEmpty) {
      final Map<int, List<Statistic>> statisticMap = new Map<int, List<Statistic>>();

      for (Statistic s in statisticList) {
        if (!statisticMap.containsKey(s.month)) {
          // new List
          List<Statistic> list = [s];
          statisticMap[s.month] = list;
        } else {
          // update List
          List<Statistic> list;
          statisticMap.forEach((key, value) {
            if (key == s.month) {
              list = value;
            }
          });
          list.add(s);
          statisticMap[s.month] = list;
        }
      }

      return statisticMap;
    }

    return new Map<int, List<Statistic>>();
  }
}