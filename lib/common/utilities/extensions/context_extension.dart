import 'package:flutter/material.dart';

extension InverseColor on BuildContext {
  Color get getInverseColor {
    return Theme.of(this).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
  }
}
