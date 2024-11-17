import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import '../../../../../model/tour_model.dart';
import '../../../../../res/app_colors.dart';
import '../../../../../res/apps_text_style.dart';
import '../../../../../res/routes/routes_name.dart';

import '../../../../../widget/labeled_icon_with_background_widget.dart';

class NearbyTourCard extends StatelessWidget {
  const NearbyTourCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tourModel = Provider.of<TourModel>(context, listen: false);
    return InkWell(
      onTap: () {
        Get.toNamed(RoutesName.tourDetailsPage, arguments: tourModel.id);
      },
      child: Container(
        padding: EdgeInsets.all(10.r),
        height: 220.h,
        width: .7.sw,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(15.r)),
        child: Column(
          children: [
            _buildTourImage(tourModel),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.h),
              child: _buildTourDetails(tourModel),
            )
          ],
        ),
      ),
    );
  }

  Column _buildTourDetails(TourModel tourModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tourModel.name!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppsFontStyle.mediumBoldFontStyle),
        SizedBox(
          height: 8.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabeledIconWithBackgroundWidget(
              color: AppColors.red,
              icon: IconlyBold.location,
              title: tourModel.address!,
            ),
            LabeledIconWithBackgroundWidget(
              color: AppColors.blueColor,
              icon: Icons.calendar_month,
              title: "25 Feb-27 Feb",
            ),
          ],
        ),
      ],
    );
  }

  SizedBox _buildTourImage(TourModel tourModel) {
    return SizedBox(
      height: 140.h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: FancyShimmerImage(
              height: 128.h,
              width: 260.w,
              boxFit: BoxFit.fill,
              imageUrl: tourModel.imageList!.first,
            ),
          ),
          Positioned(
            right: 20.w,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(5.r),
              decoration:
                  BoxDecoration(color: AppColors.red, shape: BoxShape.circle),
              child: Icon(
                IconlyBold.bookmark,
                color: AppColors.white,
                size: 20.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import '../../../../../model/tour_model.dart';
import '../../../../../res/app_colors.dart';
import '../../../../../res/apps_text_style.dart';
import '../../../../../res/routes/routes_name.dart';

import '../../../../../widget/labeled_icon_with_background_widget.dart';

class NearbyTourCard extends StatelessWidget {
  const NearbyTourCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tourModel = Provider.of<TourModel>(context, listen: false);
    return InkWell(
      onTap: () {
        Get.toNamed(RoutesName.tourDetailsPage, arguments: tourModel.id);
      },
      child: Padding(
        padding: EdgeInsets.only(right: 15.w),
        child: Container(
          height: 180.h,
          width: 1.sw,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(15.r)),
          child: Column(
            children: [
              _buildTourImage(tourModel),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.h),
                child: _buildTourDetails(tourModel),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _buildTourDetails(TourModel tourModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tourModel.name!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppsFontStyle.mediumBoldFontStyle),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabeledIconWithBackgroundWidget(
              color: AppColors.red,
              icon: IconlyBold.location,
              title: tourModel.address!,
            ),
            LabeledIconWithBackgroundWidget(
              color: AppColors.blueColor,
              icon: Icons.calendar_month,
              title: "25 Feb-27 Feb",
            ),
          ],
        ),
        SizedBox(
          height: 4.h,
        ),
      ],
    );
  }

  SizedBox _buildTourImage(TourModel tourModel) {
    return SizedBox(
      height: 160.h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: FancyShimmerImage(
              height: 148.h,
              width: 260.w,
              boxFit: BoxFit.fill,
              imageUrl: tourModel.imageList!.first,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 20.w,
            child: Container(
              padding: EdgeInsets.all(5.r),
              decoration:
                  BoxDecoration(color: AppColors.red, shape: BoxShape.circle),
              child: Icon(
                IconlyBold.bookmark,
                color: AppColors.white,
                size: 20.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

 */
