import 'package:flutter/material.dart';

import 'constant/colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          filled: true,
          fillColor: textFiledColor,
          // Replace with textFieldColor if you have one
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: textFiledColor),
          )),
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      onFieldSubmitted: (value) {
        print('Form field submitted: $value');
      },
    );
  }
}
