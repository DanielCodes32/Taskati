import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati1/core/constants/app_assets.dart';
import 'package:taskati1/core/features/Home/widgets/time_date_tile.dart';
import 'package:taskati1/core/features/Profile/widgets/custom_form_field.dart';
import 'package:taskati1/core/features/Profile/widgets/main_button.dart';
import 'package:taskati1/core/services/hive.dart';
import 'package:taskati1/core/styles/text_styles.dart';
import 'package:taskati1/core/widgets/svg_pic.dart';
import 'package:taskati1/models/taskmodel.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> { 
  String date = DateFormat("dd MMM, yyyy").format(DateTime.now());
  String starttime = DateFormat("hh:mm a").format(DateTime.now());
  String endtime = DateFormat("hh:mm a").format(DateTime.now().add(const Duration(hours: 1)));
  final titlecontroler=TextEditingController();
  final decreptioncontroler=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPic(
            assetName: AppAssets.arrowleftsvg,
            width: 15,
            height: 15,
          ),
        ),
        title: Text("Add Task", style: TextStyles.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomFormField(title: "Title",controller: titlecontroler,),
            Gap(18),
            CustomFormField(title: "Description", maxlines: false,controller: decreptioncontroler,),
            Gap(40),
            TimeDateTile(
              title: 'Date',
              subtitle: date,
              image: SvgPic(
                assetName: AppAssets.calendar,
                width: 20,
                height: 20,
              ),
               onTap: () async{
           var selectedate =   await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2030));
           if(selectedate != null){
             setState(() {
               date = DateFormat("dd MMM, yyyy").format(selectedate);
             });
           }
            },
            ),
            Gap(24),
            TimeDateTile(
              title: 'Start Time',
              subtitle: starttime,
              image: SvgPic(assetName: AppAssets.time, width: 20, height: 20),
           onTap: () async{
             var selectedtime = await showTimePicker(context: context, initialTime:TimeOfDay.now(),);
             if(selectedtime != null){
               setState(() {
                 starttime = selectedtime.format(context);
               });
             }
           },
            ),
            Gap(24),
            TimeDateTile(
              title: 'End Time',
              subtitle: endtime,
              image: SvgPic(assetName: AppAssets.time, width: 20, height: 20),
              onTap: () async{
             var selectedtime = await showTimePicker(context: context, initialTime:TimeOfDay.now(),);
             if(selectedtime != null){
               setState(() {
                 starttime = selectedtime.format(context);
               });
             }
           },

            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MainButton(title: "Add Task", onTap: () {
          String key=DateTime.now().microsecondsSinceEpoch.toString();
          HiveHelper.settask(key, Taskmodel(id:key,title: titlecontroler.text, description: decreptioncontroler.text, date: date, starttime: starttime, endtime: endtime,iscompleted: false));
          Navigator.pop(context);
        }),
      ),
    );
  }
}
