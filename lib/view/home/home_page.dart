import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../res/app_colors.dart';

import '../../controller/location_controller.dart';
import '../../loading_widget/loading_user_profile_shimmer_widget.dart';

import '../../res/apps_function.dart';
import '../../res/apps_text_style.dart';
import '../../res/routes/routes_name.dart';

import '../../widget/tab_bar_widget_information.dart';

import 'widget/tour_tab_bar_view_widget/tours_tab_bar_view_widget.dart';
import 'widget/travel_agency_tab_bar_view_widget/travel_agency_tab_bar_view.dart';
import 'widget/user_profile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  var locationController = Get.find<LocationController>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void didChangeDependencies() {
    AppsFunction.statusBarIcon();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    AppsFunction.statusBarIcon();
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.lightwhite,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),

                // User Profile
                Obx(() => _buildUserProfile()),
                SizedBox(
                  height: 10.h,
                ),
                //Search
                InkWell(
                    onTap: () {
                      Get.offAndToNamed(RoutesName.mainPage, arguments: 2);
                    },
                    child: _buildSearch()),

                SizedBox(
                  height: 10.h,
                ),

                // TabBar
                SizedBox(
                  child: TabWidgetInformation(
                    tabController: tabController,
                    tabList: [
                      AppsFunction.buildTab(title: "Tour"),
                      AppsFunction.buildTab(title: "Travel Agency"),
                    ],
                    padding: 5,
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),

                Expanded(
                  child: TabBarView(controller: tabController, children: const [
                    ToursTabBarViewWidget(),
                    TravelAgencyTabBarView()
                  ]),
                )
              ],
            ),
          )),
    );
  }

  // Search Build
  Widget _buildSearch() {
    return Row(
      children: [
        Expanded(
          flex: 14,
          child: Container(
            height: 45.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    IconlyLight.search,
                    color: AppColors.black.withOpacity(.6),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Search",
                    style: AppsFontStyle.hintTextFontStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
            flex: 2,
            child: Icon(
              IconlyBold.filter,
              color: AppColors.blueColor,
            ))
      ],
    );
  }

  Widget _buildUserProfile() {
    if (locationController.locationModel.value == null) {
      return const LoadingUserProfileShimmerWidget();
    }

    if (locationController.currentLocation.value.isEmpty) {
      locationController.fetchCurrentLocation();
    }
    return const UserProfileWidget();
  }
}
