import 'dart:async';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart' as toolkit;

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await toolkit.loadAppFonts();
  return testMain();
}

extension DoubleExtensions on double {
  String title() {
    return toString().replaceFirst('.', '_');
  }
}