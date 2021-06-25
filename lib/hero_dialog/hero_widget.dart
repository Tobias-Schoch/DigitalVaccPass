import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'custom_rect_twin.dart';

const String _heroAddTodo = 'show-qr-hero';

/// Hero widget
class AddTodoPopupCard extends StatelessWidget {
  final String qrData;

  const AddTodoPopupCard(this.qrData, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Hero(
            tag: _heroAddTodo,
            createRectTween: (begin, end) =>
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
}
