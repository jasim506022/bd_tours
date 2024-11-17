import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:see_more/see_more.dart';

import '../../../../../model/review_model.dart';
import '../../../../../res/app_colors.dart';
import '../../../../../res/apps_function.dart';
import '../../../../../res/apps_text_style.dart';
import '../../../../../widget/labeled_icon_with_background_widget.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.reviewModel,
  });

  final ReviewModel reviewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserHeader(context),
          SizedBox(height: 10.h),
          _buildDescription(),
          SizedBox(
            height: 15.h,
          ),
          if (reviewModel.commentImage?.isNotEmpty ?? false)
            _buildCommentImages()
        ],
      ),
    );
  }

  SizedBox _buildCommentImages() {
    return SizedBox(
      height: reviewModel.commentImage!.length <= 4 ? 100.h : 150.h,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: reviewModel.commentImage!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          childAspectRatio: .8,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.blueColor, width: 2),
                borderRadius: BorderRadius.circular(15.r)),
            height: 1.sh,
            width: 1.sw,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: FancyShimmerImage(
                  imageUrl: reviewModel.commentImage![index],
                  boxFit: BoxFit.fill,
                  errorWidget: const Icon(Icons.error),
                )),
          );
        },
      ),
    );
  }

  SeeMoreWidget _buildDescription() {
    return SeeMoreWidget(
      reviewModel.description!,
      textStyle: AppsFontStyle.smallFontStyle.copyWith(color: Colors.black87),
      animationDuration: const Duration(milliseconds: 200),
      seeMoreText: "See Full Description",
      seeMoreStyle: AppsFontStyle.mediumBoldFontStyle
          .copyWith(color: AppColors.blueColor),
      seeLessText: "See Less",
      seeLessStyle: AppsFontStyle.mediumBoldFontStyle
          .copyWith(color: AppColors.blueColor),
      trimLength: 470,
    );
  }

  Row _buildUserHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.blueColor, width: 2)),
          child: ClipOval(
            child: FancyShimmerImage(
              imageUrl: reviewModel.image!,
              height: 40.h,
              width: 40.h,
              boxFit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(reviewModel.name!, style: AppsFontStyle.mediumBoldFontStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabeledIconWithBackgroundWidget(
                    color: AppColors.yellow,
                    icon: IconlyBold.star,
                    title: reviewModel.rating!.toString(),
                  ),
                  Text(
                      AppsFunction.getCommentTime(
                          reviewModel.reviewId!, context),
                      style: AppsFontStyle.smallFontStyle)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
