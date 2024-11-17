import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../res/app_colors.dart';
import '../../../../../res/apps_text_style.dart';

class CardTravelAgencyWidget extends StatelessWidget {
  const CardTravelAgencyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(vertical: 15.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 10.w,
          ),
          Container(
            padding: EdgeInsets.all(10.r),
            decoration:
                BoxDecoration(color: AppColors.red, shape: BoxShape.circle),
            child: Icon(
              IconlyBold.bookmark,
              color: AppColors.white,
              size: 30.h,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hosted By", style: AppsFontStyle.smallBoldFontStyle),
                Text("Desh Bondus Travel Age",
                    style: AppsFontStyle.mediumBoldFontStyle),
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
                color: AppColors.blueColor, shape: BoxShape.circle),
            child: Icon(
              Icons.message,
              color: AppColors.white,
              size: 25.h,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
        ],
      ),
    );
  }
}
