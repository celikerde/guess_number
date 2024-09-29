import 'package:flutter/material.dart';

showPopupMessage({
  required String title,
  required String content,
  required String buttonText,
  required BuildContext context,
}) {
  Widget okButton = TextButton(
    child: Text(buttonText),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
