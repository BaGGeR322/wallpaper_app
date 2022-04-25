import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Ui {
  static void showSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(title),
        ),
      );
  }
}