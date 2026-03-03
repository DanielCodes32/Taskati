import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskati1/core/services/hive.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/text_styles.dart';

class Summary extends StatelessWidget {
  const Summary({
    super.key,  
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveHelper.taskbox.listenable(),
      builder: (context, box, child) {
         int totalTask=0;
 int completedTask=0;
for (var task in box.values) {
  if(task.date==DateFormat("dd MMM, yyyy").format(DateTime.now())){
    totalTask++;
    if(task.iscompleted==true){
      completedTask++;
    }
  }
  
}     
int completedTaskPercentage=(totalTask==0)?100:completedTask*100~/totalTask;
      return Container(
        
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateFormat("E, dd MMM").format(DateTime.now()),style: TextStyles.caption1.copyWith(color: Colors.white,fontWeight: FontWeight.w600,),),
                  Gap(13),
                  Text(
                    completedTaskPercentage==100?"Your today’s task completed":completedTaskPercentage<70?"There is still work to be done":"Your today’s task almost completed",
                    style: TextStyles.caption1.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            CircularPercentIndicator(
              
              radius: 50,
              startAngle: 90,
              percent: completedTaskPercentage/100,
              lineWidth: 8,
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: Color(0xff8764FF),
              progressColor: Colors.white,
              animation: true,
              animationDuration: 1500,
              center: Text(
                "$completedTaskPercentage%",
                style: TextStyles.caption1.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
      },
    );
  }
}
