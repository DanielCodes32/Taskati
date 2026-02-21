import 'package:flutter/material.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/text_styles.dart';
import 'package:taskati1/core/widgets/filled_icon_button.dart';


class AddressContainer extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget? icondata;
  const AddressContainer({
    super.key, required this.title, required this.subtitle, required this.icondata,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: FilledIconButton(
                iconData: icondata!,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title ?? "",
                        style: TextStyles.caption1.copyWith(
                          color: AppColors.blackColor,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: AppColors.primaryColor,
                            ),
                            padding: EdgeInsets.zero,
                            constraints:
                                const BoxConstraints(),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: AppColors.primaryColor,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle ?? "",
                    style: TextStyles.caption2.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
