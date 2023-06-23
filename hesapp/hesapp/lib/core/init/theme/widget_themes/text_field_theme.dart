import 'package:flutter/material.dart';

class TextFormFieldTheme {
  TextFormFieldTheme._();

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
      border: const OutlineInputBorder(),
      focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(100)));
}
