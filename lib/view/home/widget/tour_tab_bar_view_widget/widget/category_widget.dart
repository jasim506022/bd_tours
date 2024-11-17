
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controller/category_controller.dart';
import '../../../../../res/app_colors.dart';
import '../../../../../res/apps_text_style.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();
    return InkWell(
      splashColor: Colors.blue.withOpacity(0.2),
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      onTap: () => categoryController.setCategory(category: category),
      child: Obx(() => Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: categoryController.currentCategory.value == category
                  ? AppColors.blueColor
                  : AppColors.white),
          child: Text(category,
              style: AppsFontStyle.categoryFontStyle.copyWith(
                  color: categoryController.currentCategory.value == category
                      ? AppColors.white
                      : AppColors.black)))),
    );
  }
}
