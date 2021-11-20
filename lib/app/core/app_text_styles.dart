import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle appBar = GoogleFonts.quicksand(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle title = GoogleFonts.quicksand(
    color: AppColors.text,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle heading = GoogleFonts.quicksand(
    color: AppColors.text,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle options = GoogleFonts.quicksand(
    color: AppColors.darkGray,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle warning = GoogleFonts.quicksand(
    color: Colors.red,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle description = GoogleFonts.quicksand(
    color: AppColors.text,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle body = GoogleFonts.quicksand(
    color: AppColors.text,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle bodyBold = GoogleFonts.quicksand(
    color: AppColors.text,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}