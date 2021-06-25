import '../utils/util.dart';

/// Define vaccinations
class Vaccination {
  String vaccinationName;
  String chargeNr;
  DateTime vaccinationDate;
  String doctorSignature;
  String vaccinationDescription;

  int userId;
  int familyId;

  Vaccination(this.vaccinationName, this.chargeNr, this.vaccinationDate,
      this.doctorSignature, this.vaccinationDescription);

  Vaccination.today(this.vaccinationName, this.chargeNr, this.doctorSignature,
      this.vaccinationDescription)
      : vaccinationDate = DateTime.now();

  Vaccination.forDb(this.vaccinationName, this.chargeNr, this.vaccinationDate,
      this.doctorSignature, this.vaccinationDescription, this.userId, this.familyId);

  Map<String, dynamic> toMap() {
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

  factory Vaccination.fromMap(Map<String, dynamic> data) => Vaccination.forDb(
    data['VACCINE_NAME'],
    data['CHARGE_NR'],
    Util.getDateTimeFromString(data['VACCINE_DATE']),
    data['DOCTOR_SIGNATURE'],
    data['VACCINE_DESCRIPTION'],
    data['USER_ID'],
    data['FAMILY_ID']
  );

}