import 'package:flutter/material.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/text_styles.dart';
import 'package:taskati1/core/widgets/filled_icon_button.dart';
import 'package:taskati1/core/widgets/svg_pic.dart';


class CustomListTile extends StatelessWidget {
  final String? title;
  final String? assetName;
  final Function()? onTap;
  final bool? arrow;
 final String? subtitle;
  const CustomListTile({
    super.key,
    required this.title,
   required this.assetName,
   required this.onTap,
    this.subtitle,
     this.arrow,
  });

  @override

  Widget build(BuildContext context) {
    return Material(color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: FilledIconButton(
            iconData: SvgPic(
                assetName: assetName ?? "",
                width: 12,
                height: 14,
              ),
          ),
          
          title: Text(title??"", style: TextStyles.caption1),
          subtitle: subtitle != null && subtitle!.isNotEmpty
              ? Text(subtitle!, style: TextStyles.caption2)
              : null,
          trailing: (arrow==null||arrow==true) ? 
             Icon(
              Icons.arrow_forward_ios,
              color: AppColors.blackColor,
              size: 15,
            ):null
          ),
        
      ),
    );
  }
}
