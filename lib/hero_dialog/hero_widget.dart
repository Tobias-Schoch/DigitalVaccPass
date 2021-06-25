import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'custom_rect_twin.dart';

const String _heroAddTodo = 'show-qr-hero';

/// Hero widget
class PopupCard extends StatelessWidget {
  /// Hero widget
  const PopupCard(this.qrData, {Key key}) : super(key: key);

  final String qrData;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Hero(
            tag: _heroAddTodo,
            createRectTween: (Rect begin, Rect end) =>
                CustomRectTween(begin: begin, end: end),
            child: Material(
              color: Theme.of(context).primaryColor,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      QrImage(
                        data: qrData,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<String>('qrData_hero', qrData));
  }
}
