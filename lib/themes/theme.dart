import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lox_user/themes/app_colors.dart';

class AppTheme {
  buildTheme() {
    final ThemeData theme = ThemeData.light();

    return theme.copyWith(
      primaryColor: primaryColor,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: scaffoldColor,
      // iconTheme: iconTheme,
      // cardColor: cardColor,
      textTheme: GoogleFonts.interTextTheme(),
    );
  }
}
