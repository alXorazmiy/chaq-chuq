




import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';


class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF1E88E5), 
          secondary: Color(0xFF43A047), 
          error: Color(0xFFD32F2F),
        ),
        extensions:  [
          CustomColors.light,
        ],
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF1E88E5), 
          secondary: Color(0xFF43A047),
          error: Color(0xFFD32F2F),
        ),
        extensions:  [
          CustomColors.dark,
        ],
      );
}