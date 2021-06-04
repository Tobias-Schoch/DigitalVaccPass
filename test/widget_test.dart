// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:digital_vac_pass/about.dart';
import 'package:digital_vac_pass/addvaccination.dart';
import 'package:digital_vac_pass/familyScreen/family.dart';
import 'package:digital_vac_pass/utils/appBar.dart';
import 'package:digital_vac_pass/utils/drawer.dart';
import 'package:digital_vac_pass/faq.dart';
import 'package:digital_vac_pass/loginScreen/login.dart';
import 'package:digital_vac_pass/onboard.dart';
import 'package:digital_vac_pass/qrScreen/qrcode.dart';
import 'package:digital_vac_pass/statisticScreen/statistics.dart';
import 'package:digital_vac_pass/utils/util.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../lib/homeScreen/testresult.dart';
import '../lib/homeScreen/vaccination.dart';
import '../lib/loginScreen/forgotpassword.dart';
import '../lib/loginScreen/register.dart';
import 'util.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(MyApp());
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  testGoldens('Login Screen Test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: devicesWithDifferentTextScales,
      )
      ..addScenario(
          widget: MyLoginPage(),
          name: 'login page'
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'loginScreen');
  });

  testGoldens('Register Screen Test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: devicesWithDifferentTextScales,
      )
      ..addScenario(
          widget: MyRegisterPage(),
          name: 'register page'
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'registerScreen');
  });

  testGoldens('forgot Password Screen Test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: devicesWithDifferentTextScales,
      )
      ..addScenario(
          widget: MyForgotPasswordPage(),
          name: 'forgot Password page'
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'forgotPassword');
  });

  testGoldens('Vaccination Screen Test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: devicesWithDifferentTextScales,
      )
      ..addScenario(
          widget: MyVaccinationPage(selectedUser: TestData.userListDb.first, isFloatingActionButtonVisible: true),
          name: 'vaccination page'
      )
      ..addScenario(
          widget: MyVaccinationPage(selectedUser: TestData.userListDb.first, isFloatingActionButtonVisible: false),
          name: 'vaccination page without action button'
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'vaccinationScreen');
  });

  testGoldens('Tests Screen Test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: devicesWithDifferentTextScales,
      )
      ..addScenario(
          widget: MyTestPage(selectedUser: TestData.userListDb.first, isFloatingActionButtonVisible: true),
          name: 'tests page'
      )
      ..addScenario(
          widget: MyTestPage(selectedUser: TestData.userListDb.first, isFloatingActionButtonVisible: false),
          name: 'tests without action button page'
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'testsScreen');
  });

  testGoldens('About Screen Test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: devicesWithDifferentTextScales,
      )
      ..addScenario(
          widget: MyAboutPage(),
          name: 'about page'
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'aboutScreen');
  });

  testGoldens('addVaccination Screen Test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: devicesWithDifferentTextScales,
      )
      ..addScenario(
          widget: MyVaccinationAddPage(),
          name: 'addVaccination page'
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'addVaccinationScreen');
  });

  testGoldens('appBar Screen Test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: devicesWithDifferentTextScales,
      )
      ..addScenario(
          widget: MyHeader(),
          name: 'appbar page'
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'appbarScreen');
  });

  testGoldens('drawer Screen Test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: devicesWithDifferentTextScales,
      )
      ..addScenario(
          widget: MyDrawer(isVisible: false),
          name: 'drawer page normal'
      )
      ..addScenario(
          widget: MyDrawer(isVisible: true),
          name: 'drawer page doctor'
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'drawerScreen');
  });

  testGoldens('family Screen Test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: devicesWithDifferentTextScales,
      )
      ..addScenario(
          widget: MyFamilyPage(),
          name: 'family page'
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'familyScreen');
  });

  testGoldens('FAQ Screen Test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: devicesWithDifferentTextScales,
      )
      ..addScenario(
          widget: MyFaqPage(),
          name: 'faq page'
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'faqScreen');
  });

  testGoldens('Onboard Screen Test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: devicesWithDifferentTextScales,
      )
      ..addScenario(
          widget: MyOnboardPage(),
          name: 'onboard page'
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'onboardScreen');
  });

  testGoldens('Qrcode Screen Test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: devicesWithDifferentTextScales,
      )
      ..addScenario(
          widget: MyQRPage(),
          name: 'qrcode page'
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'qrcodeScreen');
  });

  testGoldens('Statistics Screen Test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: devicesWithDifferentTextScales,
      )
      ..addScenario(
          widget: MyStatisticPage(),
          name: 'statistics page'
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'statisticsScreen');
  });
}


