import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati1/core/features/Home/widgets/custom_tab.dart';
import 'package:taskati1/core/features/Home/widgets/tasks_list_view.dart';
import 'package:taskati1/core/styles/text_styles.dart';

class TaskBuilder extends StatefulWidget {
  const TaskBuilder({super.key});

  @override
  State<TaskBuilder> createState() => _TaskBuilderState();
}

class _TaskBuilderState extends State<TaskBuilder> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(),
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyles.caption1.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
            dividerHeight: 0,
            indicatorPadding: const EdgeInsets.all(0),
            indicatorWeight: 0,
            onTap: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            tabs: [
              CustomTab(
                isactive: currentIndex == 0,
                title: "All",
              ), //CustomTab(isactive: currentIndex == 1, title: "In Progress"),
              CustomTab(isactive: currentIndex == 1, title: "In Progress"),
              CustomTab(isactive: currentIndex == 2, title: "Compelted"),
            ],
          ),
          Gap(25),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TasksListView(),
                TasksListView(),
                TasksListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
