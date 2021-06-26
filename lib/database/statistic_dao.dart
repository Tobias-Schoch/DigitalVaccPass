
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';
import '../utils/statistic.dart';

/// DatabaseHelper
final DatabaseHelper con = DatabaseHelper();

class StatisticDAO {

  /// Add vaccination
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

  /// Get statistics for doctor each month
  static Future<List<StatisticForScreen>> getStatisticsForYear(int year) async {
    final Database dbClient = await con.db;
    final List<Map<String, Object>> statisticsFromDbList = await dbClient.query(DatabaseHelper.statisticTable, where: "YEAR = ?", whereArgs: [year], orderBy: "MONTH desc");

    final List<Statistic> statisticList = statisticsFromDbList.isNotEmpty
        ? statisticsFromDbList.map((Map<String, Object> e) => Statistic.fromMap(e)).toList()
        : List<Statistic>.empty();

    if (statisticList.isNotEmpty) {
      List<StatisticForScreen> statisticForScreenList = List.empty(growable: true);
      List<Statistic> usedStatistics = List.empty(growable: true);

      for (Statistic s in statisticList) {
        if (statisticForScreenList.isEmpty) {
          StatisticForScreen sForScreen = new StatisticForScreen(s.month, [s]);
          statisticForScreenList.add(sForScreen);
          usedStatistics.add(s);
        } else {
          for (StatisticForScreen sF in statisticForScreenList) {
            if (sF.month == s.month) {
              sF.statistics.add(s);
              usedStatistics.add(s);
            }
          }
          if (!usedStatistics.contains(s)) {
            StatisticForScreen sForScreen = new StatisticForScreen(s.month, [s]);
            statisticForScreenList.add(sForScreen);
            usedStatistics.add(s);
          }
        }
      }

      return statisticForScreenList;
    }

    return new List<StatisticForScreen>.empty();
  }
}