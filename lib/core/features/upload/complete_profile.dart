import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati1/core/constants/app_assets.dart';
import 'package:taskati1/core/features/Profile/widgets/custom_form_field.dart';
import 'package:taskati1/core/features/Profile/widgets/image_container.dart';
import 'package:taskati1/core/features/Profile/widgets/main_button.dart';
import 'package:taskati1/core/functions/custom_snake_bar.dart';
import 'package:taskati1/core/styles/app_colors.dart';
import 'package:taskati1/core/styles/text_styles.dart';
import 'package:taskati1/core/widgets/filled_icon_button.dart';
import 'package:taskati1/core/widgets/secondary_button.dart';
import 'package:taskati1/core/widgets/svg_pic.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  String? path;
  final namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Complete Your Profile", style: TextStyles.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Gap(80),
            Row(
              children: [
                Text(
                  "Profile Image",
                  style: TextStyles.caption2.copyWith(
                    color: AppColors.greycolor,
                  ),
                ),
              ],
            ),
            Gap(20),
            Stack(
              children: [
                ImageContainer(
                  image: (path != null)
                      ? Image.file(File(path!), fit: BoxFit.cover)
                      : Image.asset(AppAssets.user, fit: BoxFit.cover),
                ),
                if (path != null)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: FilledIconButton(
                      onPressed: () {
                        setState(() {
                          path = null;
                        });
                      },
                      iconData: SvgPic(
                        assetName: AppAssets.delete,
                        width: 14,
                        height: 18,
                      ),
                    ),
                  ),
              ],
            ),
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SecondaryButton(
                  text: 'From Camera',
                  ontap: () async {
                    await uploadimage(ImageSource.camera);
                  },
                ),
                Gap(10),
                SecondaryButton(
                  text: 'From Gallery',
                  ontap: () async {
                    await uploadimage(ImageSource.gallery);
                  },
                ),
              ],
            ),
            Gap(40),
            CustomFormField(title: "Your Name",controller: namecontroller,),
            Gap(210),
           
          ],
        ),
        
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: MainButton(title: "Let’s Start !", onTap: () {
                 if(path != null && namecontroller.text.isNotEmpty){
                   
                 }
                 else if(path == null&& namecontroller.text.isNotEmpty){
                   errordiag(context, "please enter your profile image");
                
                 }
                 else if(path!=null&&namecontroller.text.isEmpty){
                   errordiag(context, "Please enter your name");
                
                 }
                 else{
                  errordiag(context, "Please upload your profile image and enter your name");
                
                 }
              }),
      ),
    );
  }

  Future<void> uploadimage(ImageSource source) async {
     var image = await ImagePicker().pickImage(
      source: source,
    );
    if (image != null) {
      setState(() {
        path = image.path;
      });
    }
  }
}
