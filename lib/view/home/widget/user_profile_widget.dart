import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/location_controller.dart';
import '../../../loading_widget/loading_user_profile_shimmer_widget.dart';
import '../../../model/profile_model.dart';
import '../../../res/app_colors.dart';
import '../../../res/apps_text_style.dart';
import '../../../res/constant.dart';

import '../../../controller/profile_controller.dart';
import '../../../res/routes/string_constant.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var profileController = Get.find<ProfileController>();
    var locationController = Get.find<LocationController>();
    String? image =
        sharedPreference?.getString(AppsString.imagePreferences);
    String? name = sharedPreference?.getString(AppsString.namePreferences);
    if (image == null && name == null) {
      return FutureBuilder(
          future: profileController.getCurrentUserDocumentSnapshot(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingUserProfileShimmerWidget();
            } else if (snapshot.hasError) {
              return Text("Error : ${snapshot.error}");
            } else if (snapshot.hasData && snapshot.data!.exists) {
              ProfileModel profileModel = ProfileModel.fromMap(
                  snapshot.data!.data() as Map<String, dynamic>);
              return _buildProfileInfo(
                name: profileModel.name!,
                image: profileModel.image!,
                address: locationController.currentLocation.value,
              );
            }
            return const LoadingUserProfileShimmerWidget();
          });
    } else {
      return _buildProfileInfo(
        name: name!,
        image: image!,
        address: locationController.currentLocation.value,
      );
    }
  }

  Row _buildProfileInfo(
      {required String name, required String image, required String address}) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(width: 2.w, color: AppColors.blueColor)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: FancyShimmerImage(
                imageUrl: image,
                height: 40.w,
                width: 40.w,
                boxFit: BoxFit.fill,
              )),
        ),
        SizedBox(width: 10.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: AppsFontStyle.titleFontStyle),
            Text(address, style: AppsFontStyle.subTitleFontStyle),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () async {},
          child: Icon(
            IconlyLight.notification,
            color: AppColors.secondaryColor,
            size: 25.h,
          ),
        )
      ],
    );
  }
}
