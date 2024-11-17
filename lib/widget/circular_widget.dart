import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/app_colors.dart';

class CircularWidget extends StatelessWidget {
  const CircularWidget(
      {super.key, required this.color, this.size = 20, this.icon});

  final Color color;

  final double? size;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      padding: EdgeInsets.all(2.r),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2.w),
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: icon != null
            ? Icon(
                icon,
                size: 15,
                color: AppColors.white,
              )
            : Container(),
      ),
    );
  }
}
