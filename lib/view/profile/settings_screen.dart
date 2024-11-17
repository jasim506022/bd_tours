import 'package:bd_tour_firebase/res/apps_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../model/list_title_item_model.dart';
import '../../res/app_colors.dart';
import '../../res/apps_function.dart';
import '../../res/assets/animation_assets.dart';
import '../../widget/circular_icon_width_background_widget.dart';
import '../../widget/error_dialog_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text("Setting"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Account"),
            _buildSettingsSection([
              ListTitleItemModel(
                title: "Edit Profile",
                icon: Icons.person,
                onTap: () {
                  Get.dialog(ErrorDialogWidget(
                    title: "e.title",
                    animationAssets: AnimationAssets.noErrorAnimation,
                    content: "e.message",
                    buttonText: "Okay",
                  ));
                },
              ),
              ListTitleItemModel(
                title: "Security",
                icon: Icons.security,
                onTap: () {},
              ),
              ListTitleItemModel(
                title: "Notification",
                icon: Icons.notifications,
                onTap: () {},
              ),
              ListTitleItemModel(
                title: "Privacy",
                icon: Icons.lock,
                onTap: () {},
              ),
            ]),
            _buildSectionTitle("Support & About"),
            _buildSettingsSection([
              ListTitleItemModel(
                title: "My Subscription",
                icon: Icons.credit_card,
                onTap: () {},
              ),
              ListTitleItemModel(
                title: "Help & Support",
                icon: Icons.help,
                onTap: () {},
              ),
              ListTitleItemModel(
                title: "Terms and Policy",
                icon: Icons.policy_outlined,
                onTap: () {},
              ),
            ]),
            _buildSectionTitle("Actions"),
            _buildSettingsSection([
              ListTitleItemModel(
                title: "Report a Problem",
                icon: Icons.flag,
                onTap: () {},
              ),
              ListTitleItemModel(
                title: "Add Account",
                icon: Icons.person_3,
                onTap: () {},
              ),
              ListTitleItemModel(
                title: "Log out",
                icon: Icons.logout,
                onTap: () {},
              ),
            ])
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(List<ListTitleItemModel> items) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(.1),
          borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        children: items.map((e) => ListTitleWidget(titleItemModel: e)).toList(),
      ),
    );
  }

  Padding _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: Text(
        title,
        style: AppsFontStyle.titleFontStyle,
      ),
    );
  }
}

class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget({
    super.key,
    required this.titleItemModel,
  });

  final ListTitleItemModel titleItemModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: titleItemModel.onTap,
        titleTextStyle: AppsFontStyle.mediumBoldFontStyle,
        title: Text(titleItemModel.title),
        leading: CircularIconWithBackgroundWidget(
          color: AppColors.greenColor,
          icon: titleItemModel.icon,
          padding: 5.r,
          size: 20.h,
        ));
  }
}
