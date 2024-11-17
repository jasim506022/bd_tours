import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../res/app_colors.dart';
import '../../../../../res/apps_text_style.dart';
import 'tour_option_row.dart';

class TourIncludeWidget extends StatelessWidget {
  const TourIncludeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("What's Included", style: AppsFontStyle.titleFontStyle),
        SizedBox(height: 10.h),

        // Transport Section
        buildSectionTitle("Transport"),
        SizedBox(height: 7.h),

        // Transport Options
        const Row(
          children: [
            Expanded(
              child: TourOptionRow(
                label: "Non AC Bus",
                borderColor: Colors.red,
                fillColor: Colors.red,
              ),
            ),
            Expanded(
              child: TourOptionRow(
                label: "AC Bus",
                borderColor: Colors.black54,
                fillColor: Colors.black54,
                isSelect: false,
              ),
            ),
          ],
        ),

        SizedBox(height: 15.h),

        // Hotel Section
        buildSectionTitle("Hotel"),
        SizedBox(height: 8.h),

        // Hotel Options
        const Row(
          children: [
            Expanded(
              child: TourOptionRow(
                label: "Double Bed",
                borderColor: Colors.red,
                fillColor: Colors.red,
              ),
            ),
            Expanded(
              child: TourOptionRow(
                label: "Deluxe Bed",
                borderColor: Colors.black54,
                fillColor: Colors.black54,
                isSelect: false,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Text buildSectionTitle(String title) {
    return Text(title,
        style: AppsFontStyle.mediumBoldFontStyle
            .copyWith(color: AppColors.blueColor));
  }
}
