import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:golden_toolkit/golden_toolkit.dart' as toolkit;

class Devices {
  /// [iphoneSE] matches specs of iphone SE
  static toolkit.Device get iphoneSE => const toolkit.Device(
    size: Size(320.0, 568.0),
    name: 'iphone_se__text_scale_1_0',
    safeArea: EdgeInsets.only(top: 20.0),
  );

  /// [iphone8] matches specs of iphone 8
  static toolkit.Device get iphone8 => const toolkit.Device(
    size: Size(375.0, 667.0),
    name: 'iphone_8__text_scale_1_0',
    safeArea: EdgeInsets.only(top: 20.0),
  );

  /// [iphone11] matches specs of iphone 11
  static toolkit.Device get iphone11 => const toolkit.Device(
    size: Size(414.0, 896.0),
    name: 'iphone_11__text_scale_1_0',
    safeArea: EdgeInsets.only(top: 48.0, bottom: 34.0),
  );

  /// [iphone12ProMax] matches specs of iphone 12 Pro Max
  static toolkit.Device get iphone12ProMax => const toolkit.Device(
    size: Size(428.0, 926.0),
    name: 'iphone_12_pro_max__text_scale_1_0',
    safeArea: EdgeInsets.only(top: 47.0, bottom: 34.0),
  );

}

final devicesWithDifferentTextScales = [
  Devices.iphoneSE,
  Devices.iphone8,
  Devices.iphone11,
  Devices.iphone12ProMax,
];