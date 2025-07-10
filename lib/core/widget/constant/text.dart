import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textFormfield extends StatelessWidget {
  final String textf;

  textFormfield(this.textf);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft, // ✅ Aligns text to the start
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            textf,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.start,
          ),
        ));
  }
}
