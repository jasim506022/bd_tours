import 'package:bd_tour_firebase/res/apps_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../res/app_colors.dart';

class TabWidgetInformation extends StatelessWidget {
  const TabWidgetInformation({
    super.key,
    required this.tabController,
    required this.tabList,
    required this.padding,
  });

  final TabController tabController;
  final List<Widget> tabList;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: AppColors.blueColor,
        indicatorWeight: 5,

        padding: EdgeInsets.all(padding),
        dividerColor: Colors.transparent,
        labelColor: AppColors.black,
        indicatorPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        unselectedLabelColor: AppColors.black.withOpacity(.5),
        unselectedLabelStyle: AppsFontStyle.unselectedLabelStyle,
        labelStyle: AppsFontStyle.tabBarFontStyle,
        controller: tabController,
        tabs: tabList);
  }
}
