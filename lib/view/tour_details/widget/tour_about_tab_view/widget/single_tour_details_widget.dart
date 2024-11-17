import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:see_more/see_more_widget.dart';

import '../../../../../model/tour_model.dart';
import '../../../../../res/app_colors.dart';
import '../../../../../res/apps_text_style.dart';

class SingleTourDetailsWidget extends StatelessWidget {
  const SingleTourDetailsWidget({
    super.key,
    required this.tourModel,
  });

  final TourModel tourModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tourModel.name!, style: AppsFontStyle.titleFontStyle),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconlyBold.star,
                  color: AppColors.yellow,
                  size: 20.h,
                ),
                SizedBox(
                  width: 3.w,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: tourModel.ratting!.toStringAsFixed(2).toString(),
                      style: AppsFontStyle.smallBoldFontStyle),
                  TextSpan(
                      text: " (${tourModel.totalreview})",
                      style: AppsFontStyle.smallFontStyle),
                ])),
              ],
            ),
            SizedBox(
              width: 50.w,
            ),
            Row(
              children: [
                Icon(
                  IconlyBold.send,
                  color: AppColors.blueColor,
                  size: 20.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text("Cox's Bazar", style: AppsFontStyle.smallBoldFontStyle)
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Text("Tour Plan", style: AppsFontStyle.titleFontStyle),
        SizedBox(
          height: 5.h,
        ),
        SeeMoreWidget(
          tourModel.details!,
          textStyle:
              AppsFontStyle.smallFontStyle.copyWith(color: Colors.black87),
          animationDuration: const Duration(milliseconds: 200),
          seeMoreText: "See Full Description",
          seeMoreStyle: AppsFontStyle.mediumBoldFontStyle
              .copyWith(color: AppColors.blueColor),
          seeLessText: "See Less",
          seeLessStyle: AppsFontStyle.mediumBoldFontStyle
              .copyWith(color: AppColors.blueColor),
          trimLength: 470,
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
