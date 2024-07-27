import 'package:flutter/material.dart';
import 'package:ponto_open/widgets/text_widget.dart';

class SnackBarCustom {
  static SnackBar? _snackBar;

  static void open(
      {required BuildContext context,
      required String mesage,
      bool erro = false}) {
    _snackBar ??= SnackBar(
      backgroundColor: erro ? Colors.red : Colors.green,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      content: TextCustom(
        text: mesage,
        color: Colors.white,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(_snackBar!);
  }
}
