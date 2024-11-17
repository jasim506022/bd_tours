
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../model/tour_model.dart';
import '../../../../res/apps_text_style.dart';
import 'widget/card_travel_agency_widget.dart';
import 'widget/photo_list_widget.dart';
import 'widget/single_tour_details_widget.dart';
import 'widget/tour_include_widget.dart';

class ToursAboutTabBarWidget extends StatelessWidget {
  const ToursAboutTabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tourModel = Provider.of<TourModel>(context, listen: false);

    return IndexedStack(
      index: 0,
      children: [
        SizedBox(
          height: 0.555.sh,
          width: 1.sw,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleTourDetailsWidget(tourModel: tourModel),
                        const CardTravelAgencyWidget(),
                        SizedBox(
                          height: 25.h,
                        ),
                        const TourIncludeWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        if (tourModel.imageList!.length >= 3)
                          TourPhotoListWidget(tourModel: tourModel),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text("See Google Map",
                            style: AppsFontStyle.titleFontStyle),
                        SizedBox(
                          height: 120.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
