// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:digital_vac_pass/loginScreen/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:digital_vac_pass/main.dart';
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
          widget: MyVaccinationPage(),
          name: 'vaccination page'
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
          widget: MyTestPage(),
          name: 'tests page'
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'testsScreen');
  });
}


