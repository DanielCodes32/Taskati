
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskati1/core/constants/app_fonts.dart';
import 'package:taskati1/core/styles/app_colors.dart';



abstract class AppThemes {
  static ThemeData get lightTheme => ThemeData(
    
        fontFamily: AppFonts.Lexend,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark,backgroundColor: Colors.transparent, elevation: 0,),
    colorScheme: ColorScheme.fromSeed(
      onSurface: AppColors.blackColor,
      seedColor: AppColors.primaryColor,
      
    ),
     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.white,
  ),

  );
  }