import '../utils/util.dart';

/// Define vaccinations
class Vaccination {
  /// Vaccination name
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
  Vaccination(this.chargeNr, this.doctorSignature, this.vaccinationDate,
      this.vaccinationDescription, this.vaccinationName);

  /// vaccinations for today
  Vaccination.today(this.chargeNr, this.doctorSignature,
      this.vaccinationDescription, this.vaccinationName)
      : vaccinationDate = DateTime.now();

  /// Vaccination to db
  Vaccination.forDb(
    this.chargeNr,
    this.doctorSignature,
    this.familyId,
    this.userId,
    this.vaccinationDate,
    this.vaccinationDescription,
    this.vaccinationName,
  );

  /// Map vaccination
  Map<String, dynamic> toMap() {
    /// map
    final Map<String, dynamic> map = <String, dynamic>{};
    map['CHARGE_NR'] = chargeNr;
    map['DOCTOR_SIGNATURE'] = doctorSignature;
    map['FAMILY_ID'] = familyId;
    map['USER_ID'] = userId;
    map['VACCINE_DATE'] = vaccinationDate.toString();
    map['VACCINE_DESCRIPTION'] = vaccinationDescription;
    map['VACCINE_NAME'] = vaccinationName;
    return map;
  }

  /// factory vaccination
  factory Vaccination.fromMap(Map<String, dynamic> data) => Vaccination.forDb(
        data['CHARGE_NR'],
        data['DOCTOR_SIGNATURE'],
        data['FAMILY_ID'],
        data['USER_ID'],
        Util.getDateTimeFromString(data['VACCINE_DATE']),
        data['VACCINE_DESCRIPTION'],
        data['VACCINE_NAME'],
      );
}
