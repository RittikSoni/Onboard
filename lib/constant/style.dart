import 'package:flutter/material.dart';

class CustomStyle {
  static const headingTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20.0,
  );
  static const subHeadingTextStyle = TextStyle(
    fontSize: 15.0,
  );
}

ButtonStyle customButtonStyle() {
  return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.deepPurple.shade900));
}
