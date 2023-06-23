import 'package:flutter/material.dart';
import 'package:hesapp/core/init/theme/widget_themes/text_field_theme.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber,
                                
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))))
    ),
      inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme,
      textTheme: ThemeData.dark().textTheme.copyWith(
            labelLarge: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            labelMedium: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ));
}
