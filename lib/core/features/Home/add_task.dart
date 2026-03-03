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

class AddEditTask extends StatefulWidget {
  const AddEditTask({super.key, this.taskmodel});
final Taskmodel? taskmodel;
  @override
  State<AddEditTask> createState() => _AddEditTaskState();
}

class _AddEditTaskState extends State<AddEditTask> { 
  String date = DateFormat("dd MMM, yyyy").format(DateTime.now());
  String starttime = DateFormat("hh:mm a").format(DateTime.now());
  String endtime = DateFormat("hh:mm a").format(DateTime.now().add(const Duration(hours: 1)));
  final titlecontroler=TextEditingController();
  final decreptioncontroler=TextEditingController();
  @override
  void initState() {
    
    super.initState();
    if(widget.taskmodel != null){
      titlecontroler.text=widget.taskmodel?.title??'';
      decreptioncontroler.text=widget.taskmodel?.description??'';
      date=widget.taskmodel?.date??'';
      starttime=widget.taskmodel?.starttime??'';
      endtime=widget.taskmodel?.endtime??'';
    }
  }
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
        title: Text( widget.taskmodel==null?"Add Task":"Edit Task", style: TextStyles.title),
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
        child: MainButton(title: widget.taskmodel==null?"Add Task":"Save", onTap: () {
          if(widget.taskmodel==null){
          String key=DateTime.now().microsecondsSinceEpoch.toString();
          HiveHelper.settask(key, Taskmodel(id:key,title: titlecontroler.text, description: decreptioncontroler.text, date: date, starttime: starttime, endtime: endtime,iscompleted: false));
          }
          else{
            HiveHelper.settask(widget.taskmodel!.id!, Taskmodel(id: widget.taskmodel!.id,title: titlecontroler.text, description: decreptioncontroler.text, date: date, starttime: starttime, endtime: endtime,iscompleted: false));
          }
          Navigator.pop(context);
        }),
      ),
    );
  }
}
