import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:taskati1/core/constants/app_assets.dart';
import 'package:taskati1/core/features/Home/add_task.dart';
import 'package:taskati1/core/functions/navigations.dart';
import 'package:taskati1/core/services/hive.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/text_styles.dart';
import 'package:taskati1/core/widgets/svg_pic.dart';
import 'package:taskati1/models/taskmodel.dart';

class TasksListView extends StatefulWidget {
  const TasksListView({
    super.key, required this.taskslist,
  });
final List taskslist;
  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  @override
  Widget build(BuildContext context) {
    
        if (widget.taskslist.isEmpty) {
          return Center(
            child: Text(
              'No tasks yet',
              style: TextStyles.caption1,
            ),
          );
        }
  else
  {
        return ListView.separated(
          itemCount: widget.taskslist.length,
          separatorBuilder: (context, index) => const Gap(10),
          itemBuilder: (context, index) {
            final task = widget.taskslist[index];
            return Slidable(
              key: UniqueKey(),
              startActionPane: ActionPane(
            motion: const ScrollMotion(),
        
            dismissible: DismissiblePane(onDismissed: () {
              HiveHelper.deletetask(task.id);
            }),
        
            children: [
         
              SlidableAction(
        onPressed: (context){
          HiveHelper.deletetask(task.id);
        },
        backgroundColor: const Color(0xFFFE4A49),
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Delete',
              ),
             
            ],
          ),
        
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
        onPressed: (context){
          HiveHelper.settask(task.id, task.copyWith(iscompleted: true));
        },
        backgroundColor: const Color(0xFF7BC043),
        foregroundColor: Colors.white,
        icon: Icons.check,
        label: 'Complete',
              ),
              SlidableAction(
        onPressed: (context){
          pushTo(context, AddEditTask(taskmodel: task,));
        },
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        icon: Icons.edit,
        label: 'Edit',
              ),
            ],
          ),
              child: Builder(
                builder:(context){ return  Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                 
                 decoration: BoxDecoration(
                    color: Theme.of(context).cardColor, 
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
                              color: task.iscompleted==true?AppColors.secondarycolor:AppColors.lightorangecolor,
                            ),
                            child: Text(
                              task.iscompleted==true?"Done":
                              "In Progress",
                              style: TextStyles.caption2.copyWith(color:  task.iscompleted==true?AppColors.primaryColor:AppColors.orangecolor),
                            ),
                          ),
                
                        ],
                      ),
                    ],
                  ),
                );
                }
              ),
            );
          },
        );
  }
    
  }
}