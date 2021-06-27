/// Statistic
class Statistic {
  String vaccineName;
  int amount;
  int month;
  int year;

  /// Statistic for vaccine
  Statistic(this.vaccineName, this.amount, this.month, this.year);

  /// Statistic to Map
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['VACCINE_NAME'] = vaccineName;
    map['AMOUNT'] = amount;
    map['MONTH'] = month;
    map['YEAR'] = year;
    return map;
  }

  /// Statistic from Map
  factory Statistic.fromMap(Map<String, dynamic> data) => Statistic(
      data['VACCINE_NAME'], data['AMOUNT'], data['MONTH'], data['YEAR']);
}

/// Statistic for doctor screen
class StatisticForScreen {
  int month;
  List<Statistic> statistics;

  StatisticForScreen(this.month, this.statistics);
}

class GetAllVaccines {
  String vaccineName;

  factory GetAllVaccines.fromMap(Map<String, dynamic> data) => GetAllVaccines(
      data['VACCINE_NAME']);

  GetAllVaccines(this.vaccineName);
}

