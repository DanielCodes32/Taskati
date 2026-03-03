import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskati1/core/constants/app_fonts.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/text_styles.dart';

abstract class AppThemes {
  
  static ThemeData get lightTheme => ThemeData(
    fontFamily: AppFonts.Lexend,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    datePickerTheme:DatePickerThemeData(
      backgroundColor: AppColors.backgroundColor,
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.backgroundColor,
      
    ),
  
    cardColor: AppColors.backgroundColor,
     inputDecorationTheme: InputDecorationTheme(
  filled: true,
  fillColor: AppColors.backgroundColor,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide.none,
  ),
),
    colorScheme: ColorScheme.fromSeed(
      onSurface: AppColors.blackColor,
      seedColor: AppColors.primaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.white,
    ),
  );
  static ThemeData get darktheme => ThemeData(
    cardColor: AppColors.blackColor,
    fontFamily: AppFonts.Lexend,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyles.title.copyWith(color: AppColors.backgroundColor,fontFamily: AppFonts.Lexend),
      elevation: 0,
      foregroundColor: AppColors.backgroundColor,
    ),
    colorScheme: ColorScheme.fromSeed(
      onSurface: AppColors.backgroundColor,
      seedColor: AppColors.primaryColor,
    ),
   inputDecorationTheme: InputDecorationTheme(
  filled: true,
  fillColor: AppColors.blackColor,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide.none,
  ),
),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.white,
    ),
    datePickerTheme:DatePickerThemeData(
      backgroundColor: AppColors.blackColor,
       headerBackgroundColor: AppColors.primaryColor,
      headerForegroundColor: AppColors.backgroundColor
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.blackColor,
      dialBackgroundColor: AppColors.blackColor,
      hourMinuteColor: AppColors.primaryColor
   
    ),
  );
}
