import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:taskati1/core/styles/app_colors.dart';

class HomeDatePicker extends StatefulWidget {
  const HomeDatePicker({
    super.key,
  });

  @override
  State<HomeDatePicker> createState() => _HomeDatePickerState();
}

class _HomeDatePickerState extends State<HomeDatePicker> {
  final controller=DatePickerController();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      controller.jumpToSelection();
    });
  }
  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      controller: controller,
      selectionColor: AppColors.primaryColor,
      width: 64,
      height: 90,
      onDateChange: (date) {},
    );
  }
}
