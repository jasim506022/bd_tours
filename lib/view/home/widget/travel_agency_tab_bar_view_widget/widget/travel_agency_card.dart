import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../res/app_colors.dart';
import '../../../../../res/apps_text_style.dart';


import '../../../../../widget/circular_image_stack.dart';
import '../../../../../widget/count_label_widget.dart';
import '../../../../../widget/labeled_icon_with_background_widget.dart';
import '../../../../../widget/stacked_image_widget.dart';

class TravelAgencyCard extends StatelessWidget {
  TravelAgencyCard({
    super.key,
  });

  final urlImages = [
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    final items = urlImages
        .map((urlImage) => CircularImageStack(urlImage: urlImage))
        .toList();
    return InkWell(
      onTap: () {
        // Get.to(const TravelAgency());
      },
      child: Padding(
        padding:  EdgeInsets.only(bottom: 15.h),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          height: 122.h,
          width: 1.sw,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
          child: Column(
            children: [
              Row(
                children: [
                  _buildAgencyLogo(),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                      child: _buildAgencyDetails())
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              _buildSocialProof(items)
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSocialProof(List<CircularImageStack> items) {
    return Row(
              children: [
                StackedWidgets(
                  direction: TextDirection.ltr,
                  items: items,
                  size: 25.h,
                  xShift: 8.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                CountLabelWidget(
                  color: AppColors.blueColor,
                  totalTour: 25,
                  description: "Peoples Like This",
                ),
              ],
            );
  }

  Column _buildAgencyDetails() {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "VENUS Travel Agency",
                      style: AppsFontStyle.mediumBoldFontStyle,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        CountLabelWidget(
                          color: AppColors.deepGreen,
                          totalTour: 20,
                          description: "Tours is Available",
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        LabeledIconWithBackgroundWidget(
                          color: AppColors.yellow,
                          icon: IconlyBold.star,
                          title: "4.9",
                          textColor: AppColors.black,
                        ),
                      ],
                    ),
                  ],
                );
  }

  Container _buildAgencyLogo() {
    return Container(
                  height: 50.h,
                  width: 50.h,
                  decoration: BoxDecoration(
                      color: AppColors.greenColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.person,
                    color: AppColors.white,
                    size: 40,
                  ),
                );
  }
}
