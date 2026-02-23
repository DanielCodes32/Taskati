import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati1/core/constants/app_assets.dart';
import 'package:taskati1/core/features/Home/home.dart';
import 'package:taskati1/core/features/upload/complete_profile.dart';
import 'package:taskati1/core/functions/navigations.dart';
import 'package:taskati1/core/services/shared_pref.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/text_styles.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    Future.delayed(const Duration(seconds: 3), () {
      if(SharedPref.getbool(SharedPref.boolkey)==true)
    pushReplacement(context, Home());
      else
      pushReplacement(context, CompleteProfile());
    });
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Lottie.asset(AppAssets.splash),
            Gap(10),
            Text("Taskati",style: TextStyles.title.copyWith(color: AppColors.primaryColor),),
             Gap(18),
            Text("It's time to get organized",style: TextStyles.caption1.copyWith(color: AppColors.greycolor),)

          ],
        ),
      ),
    );
  }
}