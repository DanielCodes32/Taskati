import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/text_styles.dart';

class Summary extends StatelessWidget {
  const Summary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  "Your today’s task almost \n almost ",
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
            percent: 0.85,
            lineWidth: 8,
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Color(0xff8764FF),
            progressColor: Colors.white,
            animation: true,
            animationDuration: 1500,
            center: Text(
              "85%",
              style: TextStyles.caption1.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
