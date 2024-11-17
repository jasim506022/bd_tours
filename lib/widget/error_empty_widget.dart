import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/app_colors.dart';
import '../res/assets/image_assets.dart';

class ErrorEmptyWidget extends StatelessWidget {
  const ErrorEmptyWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImagesAssets.emptyImage,
          height: 190.h,
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
              color: AppColors.red,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp),
        )
      ],
    );
  }
}