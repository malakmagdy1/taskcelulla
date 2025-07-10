import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color backColor;
  final Color foreColor;
  final VoidCallback bonPressed;
  final Key? key;

  CustomButton(
      {this.key,
      required this.buttonText,
      required this.backColor,
      required this.bonPressed,
      required this.foreColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: foreColor, backgroundColor: backColor),
        onPressed: bonPressed,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 50.0, right: 50, top: 10, bottom: 10),
          child: Text(
            buttonText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ));
  }
}
//flutter test test/model/sign_in_test.dart
