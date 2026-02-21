import 'package:flutter/material.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/text_styles.dart';

class SecondaryButton extends StatelessWidget {
  final String? text;
  final Function()? ontap;
  const SecondaryButton({super.key, required this.text, required this.ontap});

  @override
    Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondarycolor,
        minimumSize: Size(126, 35),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        text??"",
        style: TextStyles.caption1.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
