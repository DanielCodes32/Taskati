import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati1/core/constants/app_assets.dart';
import 'package:taskati1/core/features/Profile/widgets/image_container.dart';
import 'package:taskati1/core/services/hive.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/text_styles.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String name='';
  String path='';
  @override
  void initState() {
    super.initState();
    getuserinfo();

  }
   Future<void> getuserinfo() async {
  final nameValue = await HiveHelper.getUserInfo(HiveHelper.namekey);
  final pathValue = await HiveHelper.getUserInfo(HiveHelper.imagekey);

  setState(() {
    name = nameValue ?? '';
    path = pathValue ?? '';
  });
}
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      ImageContainer(width: 80,height: 80,image: path.isNotEmpty?Image.file(fit: BoxFit.cover,File(path)):Image.asset(AppAssets.user),),
      Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello!",style: TextStyles.caption1.copyWith(color: AppColors.greycolor),),
            Text(name,style: TextStyles.title,),
        ]),
      )
    ]);
  }
}