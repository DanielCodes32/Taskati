import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati1/core/features/Home/add_task.dart';
import 'package:taskati1/core/features/Home/widgets/date_picker.dart';
import 'package:taskati1/core/features/Home/widgets/home_header.dart';
import 'package:taskati1/core/features/Home/widgets/summary.dart';
import 'package:taskati1/core/features/Home/widgets/task_builder.dart';
import 'package:taskati1/core/functions/navigations.dart';
import 'package:taskati1/core/styles/app_colors.dart';


class Home extends StatelessWidget {
  const Home({super.key});

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
                HomeDatePicker(),
                Gap(30),
                TaskBuilder(),
                
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        
        shape: const CircleBorder(),
        onPressed: () { pushTo(context,AddTask() );},
        child: const Icon(Icons.add,color: AppColors.backgroundColor,),
      ),
    );
  }
}
