import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati1/core/constants/app_assets.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/text_styles.dart';
import 'package:taskati1/core/widgets/svg_pic.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (context, index) {
        return const Gap(10);
      },
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 7,
          ),
    
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withValues(alpha: .1),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Market Research", style: TextStyles.caption1),
              Gap(3),
              Text(
                "Grocery shopping app design Grocery shopping app design",
                style: TextStyles.caption2.copyWith(
                  color: AppColors.greycolor,
                ),
              ),
              Gap(3),
              Row(
                children: [
                  SvgPic(
                    assetName: AppAssets.time,
                    width: 20,
                    height: 20,
                  ),
                  Gap(6),
                  Text(
                    "10:00 AM - 12:00 AM",
                    style: TextStyles.caption2.copyWith(
                      color: Color(0xffAB94FF),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.lightorangecolor,
                    ),
                    child: Text(
                      "In Progress",
                      style: TextStyles.caption2.copyWith(
                        color: AppColors.orangecolor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
