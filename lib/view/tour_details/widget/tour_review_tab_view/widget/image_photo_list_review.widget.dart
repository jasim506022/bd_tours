import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controller/review_controller.dart';
import '../../../../../res/app_colors.dart';

class ImagePhotoListReview extends StatelessWidget {
  const ImagePhotoListReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var reviewController = Get.find<ReviewController>();
    return Obx(
      () => SizedBox(
        height: reviewController.imageXFFleList.length <= 4 ? 100.h : 150.h,
        child: GridView.builder(
          itemCount: reviewController.imageXFFleList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            childAspectRatio: .8,
          ),
          itemBuilder: (context, index) {
            final xFile = reviewController.imageXFFleList[index];

            return Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blueColor, width: 2),
                      borderRadius: BorderRadius.circular(15.r)),
                  height: 1.sh,
                  width: 1.sw,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.file(
                      File(xFile!.path),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: AppColors.red, blurRadius: 2)
                        ],
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(2.r),
                      child: Icon(
                        Icons.delete,
                        color: AppColors.red,
                        size: 20.h,
                      ),
                    ),
                    onTap: () {
                      reviewController.deleteImage(index);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
