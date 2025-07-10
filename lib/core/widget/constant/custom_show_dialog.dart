import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void showCustomDialog(
    BuildContext context, String titleDialog, String contentDialog) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(titleDialog),
        content: Text(contentDialog),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // close the dialog
            },
          ),
        ],
      );
    },
  );
}
