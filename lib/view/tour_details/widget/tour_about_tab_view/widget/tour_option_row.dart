import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../res/app_colors.dart';
import '../../../../../res/apps_text_style.dart';
import '../../../../../widget/circular_widget.dart';

class TourOptionRow extends StatelessWidget {
  final String label;
  final Color borderColor;
  final Color fillColor;
  final bool? isSelect;

  const TourOptionRow(
      {super.key,
      required this.label,
      required this.borderColor,
      required this.fillColor,
      this.isSelect = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularWidget(color: borderColor),
        SizedBox(width: 6.w),
        Text(label,
            style: AppsFontStyle.smallFontStyle.copyWith(
                color: isSelect!
                    ? AppColors.black
                    : AppColors.black.withOpacity(.6))),
      ],
    );
  }
}
