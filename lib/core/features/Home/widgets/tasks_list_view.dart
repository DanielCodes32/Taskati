import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:taskati1/core/constants/app_assets.dart';
import 'package:taskati1/core/services/hive.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/text_styles.dart';
import 'package:taskati1/core/widgets/svg_pic.dart';
import 'package:taskati1/models/taskmodel.dart';

class TasksListView extends StatefulWidget {
  const TasksListView({
    super.key,
  });

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveHelper.taskbox.listenable(),
      builder: (context, Box<Taskmodel> box, _) {
        final taskslist = box.values.toList();

        return ListView.separated(
          itemCount: taskslist.length,
          separatorBuilder: (context, index) => const Gap(10),
          itemBuilder: (context, index) {
            final task = taskslist[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
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
                  Text(task.title ?? "", style: TextStyles.caption1),
                  Gap(3),
                  Text(
                    task.description ?? "",
                    style: TextStyles.caption2.copyWith(color: AppColors.greycolor),
                  ),
                  Gap(3),
                  Row(
                    children: [
                      SvgPic(assetName: AppAssets.time, width: 20, height: 20),
                      Gap(6),
                      Text(
                        '${task.starttime ?? ""} - ${task.endtime ?? ""}',
                        style: TextStyles.caption2.copyWith(color: const Color(0xffAB94FF)),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.lightorangecolor,
                        ),
                        child: Text(
                          "In Progress",
                          style: TextStyles.caption2.copyWith(color: AppColors.orangecolor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}