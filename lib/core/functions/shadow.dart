
  import 'package:flutter/material.dart';
import 'package:taskati1/core/styles/app_colors.dart';

BoxShadow customshadow() {
    return BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: .1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          );
  }