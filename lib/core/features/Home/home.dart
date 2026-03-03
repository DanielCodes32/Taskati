import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskati1/core/features/Home/add_task.dart';
import 'package:taskati1/core/features/Home/widgets/custom_tab.dart';
import 'package:taskati1/core/features/Home/widgets/date_picker.dart';
import 'package:taskati1/core/features/Home/widgets/home_header.dart';
import 'package:taskati1/core/features/Home/widgets/summary.dart';
import 'package:taskati1/core/features/Home/widgets/tasks_list_view.dart';
import 'package:taskati1/core/functions/navigations.dart';
import 'package:taskati1/core/services/hive.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/text_styles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                HomeHeader(),
                Gap(25),
                Summary(),
                Gap(25),
                HomeDatePicker(
                  onDateChange: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
                Gap(30),
                TabBar(
                  dividerColor: Colors.transparent,
                  indicator: const BoxDecoration(),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyles.caption1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  tabs: [
                    CustomTab(isactive: currentIndex == 0, title: "All"),
                    CustomTab(
                      isactive: currentIndex == 1,
                      title: "In Progress",
                    ),
                    CustomTab(isactive: currentIndex == 2, title: "Completed"),
                  ],
                ),
                const Gap(25),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: HiveHelper.taskbox.listenable(),
                    builder: (context, box, child) {
                      List dailyTasks = [];
                      List inprogressTasks = [];
                      List completedTasks = [];
                      for (var task in box.values) {
                        if (task.date ==
                            DateFormat("dd MMM, yyyy").format(selectedDate)) {
                          dailyTasks.add(task);
                          if (task.iscompleted == false) {
                            inprogressTasks.add(task);
                          } else if (task.iscompleted == true) {
                            completedTasks.add(task);
                          }
                        }
                      }
                      return TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          TasksListView(taskslist: dailyTasks),
                          TasksListView(taskslist: inprogressTasks),
                          TasksListView(taskslist: completedTasks),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,

        shape: const CircleBorder(),
        onPressed: () {
          pushTo(context, AddEditTask());
        },
        child: const Icon(Icons.add, color: AppColors.backgroundColor),
      ),
    );
  }
}
