import 'package:flutter/material.dart';

class AppColors {
  static const teal = Color(0xFF02B1B5);
  static const tealDark = Color(0xFF039EA2);
  static const tealButton = Color(0xFF1DB8A8);
  static const chipBg = Color(0xFFE7F7F6);
  static const chipText = Color(0xFF3AA8A3);
  static const followOrange = Color(0xFFFF8A1A);
  static const playOrange = Color(0xFFFF8C1A);
  static const atlantisSky = Color(0xFF6F82F5);
  static const atlantisDeep = Color(0xFF4E63E8);
  static const hostCard = Color(0xFF3B2A7A);
  static const hostCardBottom = Color(0xFF2C1C5C);
  static const inviteYellow = Color(0xFFFFD43B);
  static const relaxGold = Color(0xFFF3C44A);
  static const textDark = Color(0xFF1A1A1A);
  static const textMuted = Color(0xFF7A7A7A);
}

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.tealDark),
    scaffoldBackgroundColor: const Color(0xFFF4F7FB),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      backgroundColor: Colors.white,
      foregroundColor: AppColors.textDark,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
  );
}
