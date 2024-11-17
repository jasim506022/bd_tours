import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../controller/review_controller.dart';
import '../../../../../model/tour_model.dart';
import '../../../../../res/app_colors.dart';

import '../../../../../res/apps_text_style.dart';
import '../../../../../res/constant.dart';
import '../../../../../res/routes/string_constant.dart';
import 'image_photo_list_review.widget.dart';

class CommentsBoxWidget extends StatelessWidget {
  const CommentsBoxWidget({super.key, required this.tourModel});

  final TourModel tourModel;

  @override
  Widget build(BuildContext context) {
    var reviewController = Get.find<ReviewController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCommentInputSection(reviewController),
        const SizedBox(
          height: 7,
        ),
        Obx(
          () => reviewController.imageXFFleList.isNotEmpty
              ? const ImagePhotoListReview()
              : Container(),
        ),
        Obx(
          () => Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () async {
                  await reviewController.uploadReviewed(tourModel: tourModel);
                },
                child: reviewController.loadingController.isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        "Comment",
                        style: AppsFontStyle.buttonFontStyle,
                      )),
          ),
        ),
      ],
    );
  }

  Container _buildCommentInputSection(ReviewController reviewController) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: FancyShimmerImage(
                  imageUrl: sharedPreference!
                      .getString(AppsString.imagePreferences)!,
                  height: 50.h,
                  width: 50.h,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: TextFormField(
                  controller: reviewController.textEditingController,
                  maxLines: null,
                  style: AppsFontStyle.mediumNormalFontStyle,
                  decoration: InputDecoration(
                      hintText: "Comment Here",
                      hintStyle: AppsFontStyle.hintTextReviewFontStyle,
                      fillColor: Colors.grey.withOpacity(.2),
                      filled: true,
                      border: _buildOutlineInputBorder(),
                      enabledBorder: _buildOutlineInputBorder(),
                      focusedBorder: _buildOutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 5.h,
                      )),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              InkWell(
                  onTap: () {
                    reviewController.captureImage();
                  },
                  child:
                      Icon(Icons.image_outlined, color: AppColors.blueColor)),
              InkWell(
                  onTap: () {
                    reviewController
                        .captureImage(ImageSource.camera);
                  },
                  child: Icon(Icons.camera_alt_outlined,
                      color: AppColors.blueColor))
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          RatingBar.builder(
            initialRating: 3,
            minRating: .5,
            itemSize: 30.h,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              size: 15.h,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              reviewController.inputRatting.value = rating;
            },
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent, width: 0),
        borderRadius: BorderRadius.circular(15));
  }
}
