import '../utils/test.dart';
import '../utils/vaccination.dart';

/// User
class User {
  /// User ID
  int userDbId;
  /// User Name
  String userName;
  /// User Mail
  String userEmail;
  /// User Password
  String userPassword;
  /// User Role
  Role userRole;

  // TODO Might not need those 2 lists, because of db
  /// List for vaccinations
  List<Vaccination> vaccinations;
  /// List for tests
  List<Test> tests;
  /// Get logged in user
  static User loggedInUser;

  /// Single User
  User(this.userName, this.userEmail, this.userPassword, this.userRole);

  /// Single User with tests and vaccinations
  User.withData(this.userName, this.userEmail, this.userPassword, this.userRole,
      this.vaccinations, this.tests);

  /// Single user with primary id
  User.fromDb(this.userDbId, this.userName, this.userEmail, this.userPassword,
      this.userRole, this.vaccinations, this.tests);

  /// Single family member with primary id
  User.familyMember(this.userDbId, this.userName, this.userEmail);

  /// Single family member without primary id
  User.familyMemberWithoutId(this.userName, this.userEmail);

  /// User get map
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['USER_NAME'] = userName;
    map['USER_EMAIL'] = userEmail;
    map['PASSWORD'] = userPassword;
    map['USER_ROLE'] = userRole.toString();
    return map;
  }

  /// Family member get map
  Map<String, dynamic> toFamilyMemberMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['FAMILY_MEMBER_NAME'] = userName;
    map['FAMILY_MEMBER_EMAIL'] = userEmail;
    return map;
  }

  /// User from Map
  factory User.fromMap(Map<String, dynamic> data) => User.fromDb(
      data['USER_ID'],
      data['USER_NAME'],
      data['USER_EMAIL'],
      data['PASSWORD'],
      getRoleFromString(data['USER_ROLE']),
      null,
      null);

  /// Family member from map
  factory User.familyMemberFromMap(Map<String, dynamic> data) =>
      User.familyMember(
        data['FAMILY_MEMBER_ID'],
        data['FAMILY_MEMBER_NAME'],
        data['FAMILY_MEMBER_EMAIL'],
      );

  /// Get user role
  static Role getRoleFromString(String data) {
    switch (data) {
      case 'Role.doctor':
        return Role.doctor;
      default:
        return Role.normal;
    }
  }
}

/// Enum for user roles
enum Role { normal, doctor }
