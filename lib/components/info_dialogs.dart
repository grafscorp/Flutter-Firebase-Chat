import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void showInfoDialog(BuildContext context, String title, String des) {}
void showErrorDialog(BuildContext context, String title, String des) {
  AwesomeDialog(
      width: 350.0,
      context: context,
      title: title,
      desc: des,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      btnOkOnPress: () {})
    ..show();
}
