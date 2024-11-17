import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../model/tour_model.dart';
import '../../res/app_colors.dart';
import '../../res/apps_text_style.dart';


class TourAgencyWidget extends StatelessWidget {
  const TourAgencyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tourModel = Provider.of<TourModel>(context, listen: false);
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => TourDetailsPage(tourModel: tourModel),
        //     ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Container(
          height: 180.h,
          width: .6.sw,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: FancyShimmerImage(
                      height: 120.h,
                      width: 260.w,
                      boxFit: BoxFit.fill,
                      imageUrl: tourModel.imageList![0],
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tourModel.name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppsFontStyle.mediumBoldFontStyle),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color:
                                        AppColors.blueColor.withOpacity(.1),
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.calendar_month,
                                      size: 14,
                                      color: AppColors.blueColor,
                                    )),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "25 Feb-27 Feb",
                                  style: AppsFontStyle.smallFontStyle,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                right: 0,
                bottom: 5,
                child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                        color: AppColors.red, shape: BoxShape.circle),
                    child: Column(
                      children: [
                        Text(
                          "৳",
                          style: AppsFontStyle.smallFontStyle
                              .copyWith(color: AppColors.white),
                        ),
                        Text(tourModel.price.toString(),
                            style: AppsFontStyle.smallFontStyle
                                .copyWith(color: AppColors.white))
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}