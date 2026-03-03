import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:taskati1/core/constants/app_assets.dart';
import 'package:taskati1/core/features/splash/splash_screen.dart';
import 'package:taskati1/core/functions/extentions.dart';
import 'package:taskati1/core/services/hive.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/themes.dart';
import 'package:taskati1/hive/hive_registrar.g.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   Hive.registerAdapters();
  await HiveHelper.init();
  HiveHelper.setinfo(HiveHelper.isdark, false);
  // await SharedPref.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveHelper.userbox.listenable(),
      builder: (context, box, child) {
        bool isdark=context.isDark;
      
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darktheme,
        themeMode: isdark?ThemeMode.dark:ThemeMode.light,
        builder: (context, child) {
          return
            Container(height: double.infinity,width: double.infinity,color: isdark?AppColors.blackColor:AppColors.backgroundColor,
                    
              child: SafeArea(
                top: false,
                bottom: true,
                child: Scaffold(
                  body: Stack(
                    children: [
                    
                       Container(height: double.infinity,width: double.infinity,color: isdark?AppColors.blackColor:AppColors.backgroundColor,),
                    Image.asset(height: double.infinity,width: double.infinity,AppAssets.backgroundimage,fit: BoxFit.cover,),
                    child!,
                    ],
                  ),
                ),
              ),
            );
          
        },
      
        home: const SplashScreen(),
      );
      },
    );
  }
}