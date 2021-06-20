/// Define vaccinations
class Vaccination {
  String vaccinationName;
  String chargeNr;
  DateTime vaccinationDate;
  String doctorSignature;
  String vaccinationDescription;

  Vaccination(this.vaccinationName, this.chargeNr, this.vaccinationDate,
      this.doctorSignature, this.vaccinationDescription);

  Vaccination.today(this.vaccinationName, this.chargeNr, this.doctorSignature,
      this.vaccinationDescription)
      : vaccinationDate = DateTime.now();
}