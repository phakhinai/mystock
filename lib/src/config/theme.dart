import 'package:flutter/material.dart';

class Theme {
  const Theme();

  static const Color primaryColor = Color(0xFF0FA76C);

  static const Color gradientStart = Color(0xFF0FA76C);
  static const Color gradientEnd = Color(0xFFFFFFFF);

  static const gradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.5, 1.0],
  );
}
