import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../model/tour_model.dart';
import '../../../res/app_colors.dart';
import '../../../res/apps_function.dart';
import '../../../widget/tab_bar_widget_information.dart';

import 'tour_review_tab_view/tour_review_tab_view_widget.dart';
import 'tour_about_tab_view/tour_about_tab_bar_widget.dart';

class TourDetailsWidget extends StatelessWidget {
  const TourDetailsWidget({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    var tourModel = Provider.of<TourModel>(context, listen: false);
    return Positioned(
      top: 0.28.sh,
      child: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          color: AppColors.lightwhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: Column(
            children: [
              TabWidgetInformation(
                tabController: tabController,
                tabList: [
                  AppsFunction.buildTab(title: "About"),
                  AppsFunction.buildTab(title: "Reviews"),
                ],
                padding: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [

                    ChangeNotifierProvider.value(
                      value: tourModel,
                      child: const ToursAboutTabBarWidget(),
                    ),
                    ChangeNotifierProvider.value(
                      value: tourModel,
                      child: const TourReviewsWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
