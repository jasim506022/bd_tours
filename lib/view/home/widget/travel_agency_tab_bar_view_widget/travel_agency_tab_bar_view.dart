import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../res/apps_text_style.dart';

import 'widget/travel_agency_card.dart';


class TravelAgencyTabBarView extends StatelessWidget {
  const TravelAgencyTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Travel Agency",
          style: AppsFontStyle.titleFontStyle,
        ),
         SizedBox(
          height: 10.h,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return TravelAgencyCard();
            },
          ),
        )
      ],
    );
  }
}
