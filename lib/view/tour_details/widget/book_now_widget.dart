import 'package:bd_tour_firebase/res/apps_text_style.dart';
import 'package:bd_tour_firebase/view/booking/booking_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../model/tour_model.dart';

import '../../../res/app_colors.dart';

class BookNowWidget extends StatelessWidget {
  const BookNowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tourModel = Provider.of<TourModel>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Colors.black54, blurRadius: 2, blurStyle: BlurStyle.outer)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total Cost",
                        style: AppsFontStyle.mediumBoldFontStyle
                            .copyWith(color: AppColors.blueColor)),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "${tourModel.price!} \$ ",
                          style: AppsFontStyle.largeBoldFontStyle),
                      TextSpan(
                          text: "Person",
                          style: AppsFontStyle.hintBoldFontStyle)
                    ])),
                  ],
                ),
              )),
          Expanded(
            flex: 4,
            child: InkWell(
              onTap: () {
                Get.to(BookingPage());
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text("Book Now",
                      textAlign: TextAlign.center,
                      style: AppsFontStyle.largeBoldFontStyle
                          .copyWith(color: AppColors.white)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BookingGuideWidget extends StatelessWidget {
  const BookingGuideWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      IconlyLight.message,
                      size: 30,
                      color: AppColors.blueColor,
                    ),
                    Icon(IconlyLight.call, size: 30, color: AppColors.blueColor)
                  ],
                ),
              )),
          Expanded(
            flex: 5,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Book Now",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
