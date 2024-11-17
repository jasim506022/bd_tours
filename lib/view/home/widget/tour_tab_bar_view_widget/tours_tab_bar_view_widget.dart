
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../res/apps_text_style.dart';
import '../../../tour_details/tours_page.dart';
import 'widget/list_category_widget.dart';
import 'widget/list_near_tour_widget.dart';

import 'widget/list_tour_widget.dart';
import 'widget/row_widget.dart';

class ToursTabBarViewWidget extends StatelessWidget {
  const ToursTabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Categories",
            style: AppsFontStyle.titleFontStyle,
          ),

          const ListCategoryWidget(),

          //Row Widget
          RowWidget(
            title: "Nearby Tours",
            function: () {
              Get.to(const ToursPage(
                isNearBy: true,
              ));
            },
          ),

          SizedBox(
            height: 10.h,
          ),

          SizedBox(
              height: 230.h,
              width: double.infinity,
              child: const ListNearTourWidget()),

          SizedBox(
            height: 5.h,
          ),
          RowWidget(
            title: "Popular Designation",
            function: () {
              Get.to(const ToursPage(
                isPopular: true,

              ));
            },
          ),

          SizedBox(
            height: 5.h,
          ),

          const ListTourWidget(
            isPopular: true,
            isScroll: false,
          ),

          // PopularWidget()
        ],
      ),
    );
  }
}
