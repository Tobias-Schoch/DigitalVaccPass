import 'package:sqflite/sqflite.dart';

import '../utils/statistic.dart';
import 'database_helper.dart';

/// DatabaseHelper
final DatabaseHelper con = DatabaseHelper();

/// Statistic DAO
class StatisticDAO {
  /// Add vaccination
  static Future<int> create(String vaccineName, DateTime vaccineDate) async {
    final Database dbClient = await con.db;
    final List<Map<String, Object>> statisticFromDbList = await dbClient.query(
        DatabaseHelper.statisticTable,
        where: 'VACCINE_NAME = ? AND MONTH = ? AND YEAR = ?',
        whereArgs: [vaccineName, vaccineDate.month, vaccineDate.year],
        limit: 1);

    final List<Statistic> statisticList = statisticFromDbList.isNotEmpty
        ? statisticFromDbList
        .map((Map<String, Object> e) => Statistic.fromMap(e))
        .toList()
        : List<Statistic>.empty();

    if (statisticList.isNotEmpty) {
      // update
      final Map<String, Object> data = {
        'AMOUNT': statisticList
            .elementAt(0)
            .amount + 1
      };
      return dbClient.update(DatabaseHelper.statisticTable, data,
          where: 'VACCINE_NAME = ? AND MONTH = ? AND YEAR = ?',
          whereArgs: [vaccineName, vaccineDate.month, vaccineDate.year]);
    } else {
      // insert
      final Statistic statisticToInsert =
      Statistic(vaccineName, 1, vaccineDate.month, vaccineDate.year);
      return dbClient.insert(
          DatabaseHelper.statisticTable, statisticToInsert.toMap());
    }
  }

  /// Get statistics for doctor each month
  static Future<List<StatisticForScreen>> getStatisticsForYear(int year) async {
    final Database dbClient = await con.db;
    final List<Map<String, Object>> statisticsFromDbList = await dbClient.query(
        DatabaseHelper.statisticTable,
        where: 'YEAR = ?',
        whereArgs: [year],
        orderBy: 'MONTH desc');

    final List<Statistic> statisticList = statisticsFromDbList.isNotEmpty
        ? statisticsFromDbList
        .map((Map<String, Object> e) => Statistic.fromMap(e))
        .toList()
        : List<Statistic>.empty();

    if (statisticList.isNotEmpty) {
      final List<StatisticForScreen> statisticForScreenList =
      List.empty(growable: true);
      final List<Statistic> usedStatistics = List.empty(growable: true);

      for (final Statistic s in statisticList) {
        if (statisticForScreenList.isEmpty) {
          final StatisticForScreen sForScreen =
          StatisticForScreen(s.month, [s]);
          statisticForScreenList.add(sForScreen);
          usedStatistics.add(s);
        } else {
          for (final StatisticForScreen sF in statisticForScreenList) {
            if (sF.month == s.month) {
              sF.statistics.add(s);
              usedStatistics.add(s);
            }
          }
          if (!usedStatistics.contains(s)) {
            final StatisticForScreen sForScreen =
            StatisticForScreen(s.month, [s]);
            statisticForScreenList.add(sForScreen);
            usedStatistics.add(s);
          }
        }
      }

      return statisticForScreenList;
    }

    return List<StatisticForScreen>.empty();
  }

  /// Get all vaccines for autocomplete
  static Future<List<GetAllVaccines>> getAllVaccines(String input) async {
    final Database dbClient = await con.db;
    final List<Map<String, Object>> statisticsFromDbList = await dbClient
        .rawQuery(
        "SELECT VACCINE_NAME FROM STATISTIC WHERE VACCINE_NAME LIKE '%$input%' GROUP BY VACCINE_NAME");

    final List<GetAllVaccines> statisticList = statisticsFromDbList.isNotEmpty
        ? statisticsFromDbList
        .map((Map<String, Object> e) => GetAllVaccines.fromMap(e)).toList()

        : List<GetAllVaccines>.empty();

    print(statisticsFromDbList);

    return statisticList;
  }
}
