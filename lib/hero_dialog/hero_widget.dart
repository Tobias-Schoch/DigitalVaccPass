import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'custom_rect_twin.dart';

const String _heroAddTodo = 'show-qr-hero';
class AddTodoPopupCard extends StatelessWidget {
  final String qrData;
  const AddTodoPopupCard(this.qrData, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Theme.of(context).primaryColor,
            elevation: 2,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    QrImage(
                      data: qrData,
                      version: QrVersions.auto,
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
}