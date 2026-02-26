import 'package:flutter/material.dart';
import 'package:taskati1/core/constants/app_assets.dart';
import 'package:taskati1/core/functions/shadow.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/text_styles.dart';
import 'package:taskati1/core/widgets/svg_pic.dart';

class TimeDateTile extends StatelessWidget {
  const TimeDateTile({
    super.key,  required this.title, required this.subtitle, required this.image, this.onTap,
  });
final String? title;
final String? subtitle;
final Widget? image;
final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(15),
            boxShadow: [
            customshadow()]
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          minTileHeight: 0,
          minVerticalPadding: 0,
          leading: image,
          title: Text(  
            title ?? "",style: TextStyles.caption2.copyWith(color: AppColors.greycolor),),
            subtitle: Text(subtitle ?? "",style: TextStyles.caption1,),
            trailing: SvgPic(assetName: AppAssets.arrowdownsvg, width: 20, height: 20),
          ),
      ),
    );
  }
}