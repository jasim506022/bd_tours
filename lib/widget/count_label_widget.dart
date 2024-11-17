
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/apps_text_style.dart';

class CountLabelWidget extends StatelessWidget {
  const CountLabelWidget({
    super.key,
    required this.color,
    required this.totalTour,
    required this.description,
  });

  final Color color;
  final int totalTour;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 7.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: color.withOpacity(.1)),
          child: Text(
            totalTour.toString(),
            style: AppsFontStyle.smallFontStyle.copyWith(color: color),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          description,
          style: AppsFontStyle.smallFontStyle,
        ),
      ],
    );
  }
}
