import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import '../../../../../model/tour_model.dart';
import '../../../../../res/app_colors.dart';
import '../../../../../res/apps_text_style.dart';

import '../../../../../res/routes/routes_name.dart';
import '../../../../../widget/circular_image_stack.dart';
import '../../../../../widget/labeled_icon_with_background_widget.dart';
import '../../../../../widget/stacked_image_widget.dart';

import '../../../../../widget/tour_price_widget.dart';

class TourCard extends StatelessWidget {
  TourCard({
    super.key,
  });

  final urlImages = [
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    var tourModel = Provider.of<TourModel>(context, listen: false);
    final items = urlImages
        .map((urlImage) => CircularImageStack(urlImage: urlImage))
        .toList();
    return InkWell(
      onTap: () =>
          Get.toNamed(RoutesName.tourDetailsPage, arguments: tourModel.id),
      child: Container(
        padding: EdgeInsets.all(10.r),
        margin:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
        height: 120.h,
        width: 1.sw,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(15.r)),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _buildTourImage(tourModel),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  flex: 10,
                  child: _buildTourDetails(tourModel, items),
                )
              ],
            ),
            Positioned(
                right: 0,
                child: TourPriceWidget(
                  tourAmount: tourModel.price!,
                ))
          ],
        ),
      ),
    );
  }

  Column _buildTourDetails(
      TourModel tourModel, List<CircularImageStack> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          tourModel.name!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppsFontStyle.mediumBoldFontStyle,
        ),
        LabeledIconWithBackgroundWidget(
          color: AppColors.blueColor,
          icon: Icons.calendar_month,
          title: "25 Feb-27 Feb",
        ),
        Row(
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
            Text(
              "36 Peoples Joined",
              style: AppsFontStyle.smallFontStyle,
            )
          ],
        )
      ],
    );
  }

  ClipRRect _buildTourImage(TourModel tourModel) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FancyShimmerImage(
          imageUrl: tourModel.imageList!.first,
          boxFit: BoxFit.fill,
          height: 100.h,
        ));
  }
}
