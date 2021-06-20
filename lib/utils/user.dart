import 'package:digital_vac_pass/utils/test.dart';
import 'package:digital_vac_pass/utils/vaccination.dart';

class User {
  int userDbId;
  String userName;
  String userEmail;
  String userPassword;
  Role userRole;
  // TODO Might not need those 2 lists, because of db
  List<Vaccination> vaccinations;
  List<Test> tests;

  static User loggedInUser;

  User(this.userName, this.userEmail, this.userPassword, this.userRole);

  User.withData(this.userName, this.userEmail, this.userPassword, this.userRole,
      this.vaccinations, this.tests);

  User.fromDb(this.userDbId, this.userName, this.userEmail, this.userPassword, this.userRole,
      this.vaccinations, this.tests);

  User.familyMember(this.userDbId, this.userName, this.userEmail);

  User.familyMemberWithoutId(this.userName, this.userEmail);

  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["USER_NAME"] = userName;
    map["USER_EMAIL"] = userEmail;
    map["PASSWORD"] = userPassword;
    map["USER_ROLE"] = userRole.toString();
    return map;
  }

  Map<String, dynamic> toFamilyMemberMap() {
    final map = new Map<String, dynamic>();
    map["FAMILY_MEMBER_NAME"] = userName;
    map["FAMILY_MEMBER_EMAIL"] = userEmail;
    return map;
  }

  factory User.fromMap(Map<String, dynamic> data) => new User.fromDb(
      data["USER_ID"],
      data["USER_NAME"],
      data["USER_EMAIL"],
      data["PASSWORD"],
      getRoleFromString(data["USER_ROLE"]),
      null,
      null
  );

  factory User.familyMemberFromMap(Map<String, dynamic> data) => new User.familyMember(
      data["FAMILY_MEMBER_ID"],
      data["FAMILY_MEMBER_NAME"],
      data["FAMILY_MEMBER_EMAIL"],
  );

  static Role getRoleFromString(String data) {
    switch (data) {
      case "Role.doctor": return Role.doctor;
      default: return Role.normal;
    }
  }
}

enum Role { normal, doctor }