import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';
import '../../res/app_colors.dart';
import '../home/widget/tour_tab_bar_view_widget/widget/list_near_tour_widget.dart';
import '../home/widget/tour_tab_bar_view_widget/widget/list_tour_widget.dart';

class ToursPage extends StatelessWidget {
  const ToursPage({super.key, this.isNearBy = false, this.isPopular = false});

  final bool isNearBy;
  final bool isPopular;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightwhite,
      appBar: AppBar(
          backgroundColor: AppColors.lightwhite,
          title: Text(_getAppBarTitle())),
      body: Column(
        children: [
          SizedBox(height: 10.h,),
          if (!isNearBy) const CategoryDropDownWidget(),
          SizedBox(height: 10.h,),
          if (isNearBy)
            const Expanded(
                child: ListNearTourWidget(
              isVertical: true,
            )),
          if (!isNearBy)
            Expanded(
                child: ListTourWidget(
              isPopular: isPopular,
            ))
        ],
      ),
    );
  }

  String _getAppBarTitle() {
    if (isNearBy) return "Near By Tour";
    if (isPopular) return "Popular Tour";
    return "Tour";
  }
}
