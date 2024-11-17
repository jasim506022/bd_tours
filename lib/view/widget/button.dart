import 'package:bd_tour_firebase/res/apps_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRoundButtonWidget extends StatelessWidget {
  const CustomRoundButtonWidget({
    super.key,
    required this.title,
    required this.onPress,
    this.buttonColors,
    this.width,
    this.height,
  });

  final String title;
  final double? height, width;
  final VoidCallback onPress;
  final Color? buttonColors;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          height: height ?? 50.h,
          width: width ?? 40.w,
          margin: EdgeInsets.symmetric(horizontal: Get.width*.25),
          decoration: BoxDecoration(
              color: buttonColors ?? AppColors.greenColor,
              borderRadius: BorderRadius.circular(50.r)),
          child: Center(
            child: Text(title, style: AppsFontStyle.buttonFontStyle),
          )),
    );
  }
}
