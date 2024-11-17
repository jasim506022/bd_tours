
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../res/app_colors.dart';
import '../res/apps_text_style.dart';
import '../view/widget/button.dart';

class ErrorDialogWidget extends StatelessWidget {
  final String animationAssets;
  final String title;
  final String? content;
  final String? buttonText;

  const ErrorDialogWidget({
    super.key,
    required this.animationAssets,
    required this.title,
    this.content,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20.r),
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              animationAssets,
              height: 100.h,
              width: 100.h,
            ),
            SizedBox(height: 20.h),
            Text(title,
                style: AppsFontStyle.titleFontStyle
                    .copyWith(color: AppColors.deepGreen)),
            const SizedBox(height: 15),
            if (content != null)
              Text(
                  content!,
                  textAlign: TextAlign.center,
                  style: AppsFontStyle.mediumBoldFontStyle
              ),
            SizedBox(height: 20.h),
            if (buttonText != null)
              CustomRoundButtonWidget(
                buttonColors: AppColors.red,
                width: double.infinity,
                title: buttonText!,
                onPress: () {
                  Get.back(); // Close the dialog
                },
              ),
          ],
        ),
      ),
    );
  }
}
