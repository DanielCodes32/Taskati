import 'package:flutter/material.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/text_styles.dart';

class CustomFormField extends StatelessWidget {
  final String? title;
  final int? keyboardtype;
  final bool? maxlines;
  final String? Function(String?)? validator;
  final Function(String)? onchanged;
  final  TextEditingController? controller;
  const CustomFormField({
    super.key,
    required this.title,
    this.keyboardtype,
    this.maxlines, this.validator,
    this.onchanged, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: TextStyles.caption2.copyWith(color: AppColors.greycolor),
        ),
        SizedBox(height: 12),
        TextFormField(
          controller: controller,
          onChanged: onchanged,
          validator: validator,
          keyboardType: keyboardtype == 1
              ? TextInputType.emailAddress
              : keyboardtype == 2
              ? TextInputType.number
              : TextInputType.text,
          minLines: maxlines == false ? 3 : 1,
          maxLines: maxlines == false ? null : 1,

          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.backgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
