import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/gobalcolor.dart';

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
        indicator: BoxDecoration(
            color: AppColors.blueColor,
            borderRadius: BorderRadius.circular(10)),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: AppColors.black,
        padding: EdgeInsets.all(padding),
        indicatorWeight: 4,
        labelColor: AppColors.white,
        unselectedLabelColor: Colors.black87,
        unselectedLabelStyle:
            GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
        labelStyle:
            GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w900),
        controller: tabController,
        tabs: tabList);
  }
}
