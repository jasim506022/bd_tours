
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/app_colors.dart';
import '../res/apps_text_style.dart';

class TourPriceWidget extends StatelessWidget {
  const TourPriceWidget({super.key, required this.tourAmount});

  final num tourAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(color: AppColors.red, shape: BoxShape.circle),
        child: Column(
          children: [
            Text(
              "৳",
              style: AppsFontStyle.smallFontStyle
                  .copyWith(color: AppColors.white),
            ),
            Text(tourAmount.toString(),
                style: AppsFontStyle.smallFontStyle
                    .copyWith(color: AppColors.white))
          ],
        ));
  }
}