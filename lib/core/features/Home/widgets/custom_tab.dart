import 'package:flutter/material.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/text_styles.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({super.key, required this.isactive, required this.title});
  final bool isactive;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.all(0),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isactive
              ? AppColors.primaryColor
              : AppColors.secondarycolor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles.caption1.copyWith(
              color: !isactive 
                  ? AppColors.primaryColor
                  : AppColors.backgroundColor,

              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
