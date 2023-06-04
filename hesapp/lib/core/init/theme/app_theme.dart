import 'package:flutter/material.dart';
import 'package:hesapp/core/init/theme/widget_themes/text_field_theme.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
      inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme,
      textTheme: ThemeData.dark().textTheme.copyWith(
            labelLarge: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            labelMedium: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ));
}
