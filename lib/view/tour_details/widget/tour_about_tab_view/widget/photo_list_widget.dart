import 'package:bd_tour_firebase/res/routes/routes_name.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../model/tour_model.dart';
import '../../../../../res/app_colors.dart';
import '../../../../../res/apps_text_style.dart';

class TourPhotoListWidget extends StatelessWidget {
  const TourPhotoListWidget({
    super.key,
    required this.tourModel,
  });

  final TourModel tourModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160.h,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildPhoto(tourModel.imageList![0], flex: 3),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        buildPhoto(tourModel.imageList![1]),
                        SizedBox(height: 10.h),
                        buildPhoto(tourModel.imageList![2]),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(
              RoutesName.showImageListPage,
              arguments: tourModel.imageList,
            );
          },
          child: Container(
            width: 1.sw,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.4),
                borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: Text(
                  "See All ${tourModel.imageList!.length.toString()} Photos",
                  style: AppsFontStyle.buttonFontStyle
                      .copyWith(color: AppColors.black)),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPhoto(String imageUrl, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FancyShimmerImage(
          imageUrl: imageUrl,
          boxFit: BoxFit.fill,
          width: double.infinity,
          height: 160.h,
        ),
      ),
    );
  }
}
