import '../utils/util.dart';

/// Define vaccinations
class Vaccination {
  /// vaccinationName
  String vaccinationName;
  /// chargeNr
  String chargeNr;
  /// vaccinationDate
  DateTime vaccinationDate;
  /// doctorSignature
  String doctorSignature;
  /// vaccinationDescription
  String vaccinationDescription;

  /// userId
  int userId;
  /// familyId
  int familyId;

  /// single vaccination
  Vaccination(this.vaccinationName, this.chargeNr, this.vaccinationDate,
      this.doctorSignature, this.vaccinationDescription);

  /// vaccinations for today
  Vaccination.today(this.vaccinationName, this.chargeNr, this.doctorSignature,
      this.vaccinationDescription)
      : vaccinationDate = DateTime.now();

  /// Vaccination to db
  Vaccination.forDb(
      this.vaccinationName,
      this.chargeNr,
      this.vaccinationDate,
      this.doctorSignature,
      this.vaccinationDescription,
      this.userId,
      this.familyId);

  /// Map vaccination
  Map<String, dynamic> toMap() {
    /// map
    final map = Map<String, dynamic>();
    map['VACCINE_NAME'] = vaccinationName;
    map['CHARGE_NR'] = chargeNr;
    map['VACCINE_DATE'] = vaccinationDate.toString();
    map['DOCTOR_SIGNATURE'] = doctorSignature;
    map['VACCINE_DESCRIPTION'] = vaccinationDescription;
    map['USER_ID'] = userId;
    map['FAMILY_ID'] = familyId;
    return map;
  }

  /// factory vaccination
  factory Vaccination.fromMap(Map<String, dynamic> data) => Vaccination.forDb(
      data['VACCINE_NAME'],
      data['CHARGE_NR'],
      Util.getDateTimeFromString(data['VACCINE_DATE']),
      data['DOCTOR_SIGNATURE'],
      data['VACCINE_DESCRIPTION'],
      data['USER_ID'],
      data['FAMILY_ID']);
}
