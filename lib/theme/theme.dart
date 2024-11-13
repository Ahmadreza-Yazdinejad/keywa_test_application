import 'package:flutter/material.dart';
import 'package:keywa_test_application/constant/colors.dart';

ThemeData theme = ThemeData(
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontSize: 14,
      color: CustomColor.grey,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: CustomColor.blueAccent,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
);
