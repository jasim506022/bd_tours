import 'package:bd_tour_firebase/res/app_colors.dart';
import 'package:bd_tour_firebase/res/assets/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../res/apps_text_style.dart';

import 'home/widget/tour_tab_bar_view_widget/widget/row_widget.dart';
import 'widget/list_tour_agency.dart';

class TravelAgency extends StatefulWidget {
  const TravelAgency({super.key});

  @override
  State<TravelAgency> createState() => _TravelAgencyState();
}

class _TravelAgencyState extends State<TravelAgency> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.lightwhite,
      appBar: AppBar(
        backgroundColor: AppColors.lightwhite,
        title: Text(
          "Travel Agency",
          style: AppsFontStyle.titleRobotFontStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 90.h,
                      width: 90.h,
                      decoration: BoxDecoration(
                          color: AppColors.greenColor, shape: BoxShape.circle),
                      child: Icon(
                        Icons.person_outline,
                        color: AppColors.white,
                        size: 70.h,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "VENUS Travel Agency",
                      style: AppsFontStyle.titleFontStyle,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.blueColor, blurRadius: 1)
                              ],
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.blueColor, width: 1)),
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: AppColors.white),
                                color: AppColors.blueColor,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.done,
                              size: 15,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Verify",
                          style: AppsFontStyle.hintBoldFontStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.red.withOpacity(.2)),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: AppColors.red,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.star,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                "4.9",
                                style: AppsFontStyle.titleFontStyle
                                    .copyWith(color: AppColors.red),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.yellow.withOpacity(.2)),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: AppColors.yellow,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.star,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                "4.9",
                                style: AppsFontStyle.titleFontStyle
                                    .copyWith(color: AppColors.yellow),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    RowWidget(
                      title: "Package",
                      function: () {},
                    ),
                    const ListNearAgencyTourWidget(),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.h, vertical: 10),
                            backgroundColor: selectedIndex == 0
                                ? AppColors.black.withOpacity(.5)
                                : Colors.grey.withOpacity(.3),
                          ),
                          child: Text(
                            'About',
                            style: AppsFontStyle.tabBarFontStyle.copyWith(
                                color: selectedIndex == 0
                                    ? AppColors.white
                                    : AppColors.black),
                          ),
                        ),
                        SizedBox(width: 30.w),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.h, vertical: 10),
                            backgroundColor: selectedIndex == 1
                                ? AppColors.black.withOpacity(.4)
                                : Colors.grey.withOpacity(.3),
                          ),
                          child: Text(
                            'Contract Details',
                            style: AppsFontStyle.tabBarFontStyle.copyWith(
                                color: selectedIndex == 1
                                    ? AppColors.white
                                    : AppColors.black),
                          ),
                        ),
                      ],
                    ),
                    if (selectedIndex == 0)
                      Center(child: Text('Content for Tab 1' * 25))
                    else
                      const Center(child: Text('Content for Tab 2')),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 1.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                    color: AppColors.deepGreen,
                    borderRadius: BorderRadius.circular(25.r)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: AppColors.deepGreen.withOpacity(.2),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.calendar_month,
                            size: 20,
                            color: AppColors.white,
                          )),
                      Text(
                        "Pay Now",
                        style: AppsFontStyle.titleFontStyle
                            .copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Padding _paymentItem(String title, double price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppsFontStyle.bookingTileFontStyle),
          Text(
            "৳ $price",
            style: AppsFontStyle.mediumBoldFontStyle,
          ),
        ],
      ),
    );
  }
}

class BookingDetailsItem extends StatelessWidget {
  const BookingDetailsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  final IconData icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.deepGreen.withOpacity(.1),
                border: Border.all(color: AppColors.deepGreen),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(5),
            child: Icon(
              size: 25,
              icon,
              color: AppColors.deepGreen,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppsFontStyle.bookingTileFontStyle,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                subTitle,
                style: AppsFontStyle.mediumBoldFontStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}

/*
Scaffold(
      backgroundColor: AppColors.lightwhite,
      appBar: AppBar(
        backgroundColor: AppColors.lightwhite,
        title: Text(
          "Travel Agency",
          style: AppsFontStyle.titleFontStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          children: [
            SizedBox(
              height: .72.sh,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 100.h,
                      width: 100.h,
                      decoration: BoxDecoration(
                          color: AppColors.greenColor, shape: BoxShape.circle),
                      child: Icon(
                        Icons.person_outline,
                        color: AppColors.white,
                        size: 70.h,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "VENUS Travel Agency",
                      style: AppsFontStyle.titleFontStyle,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.blueColor, blurRadius: 1)
                                ],
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.blueColor, width: 1)),
                            child: Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: AppColors.white),
                                  color: AppColors.blueColor,
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.done,
                                size: 15,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Verify",
                            style: AppsFontStyle.hintBoldFontStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.red.withOpacity(.2)),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: AppColors.red,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.star,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                "4.9",
                                style: AppsFontStyle.titleFontStyle
                                    .copyWith(color: AppColors.red),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.yellow.withOpacity(.2)),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: AppColors.yellow,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.star,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                "4.9",
                                style: AppsFontStyle.titleFontStyle
                                    .copyWith(color: AppColors.yellow),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    RowWidget(
                      title: "Popular Designation",
                      function: () {},
                    ),
                    ListNearAgencyTourWidget(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                selectedIndex == 0 ? Colors.blue : Colors.grey,
                          ),
                          child: Text('Tab 1'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                selectedIndex == 1 ? Colors.blue : Colors.grey,
                          ),
                          child: Text('Tab 2'),
                        ),
                      ],
                    ),
                    selectedIndex == 0
                        ? Center(child: Text('Content for Tab 1' * 25))
                        : Center(child: Text('Content for Tab 2')),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              height: 60.h,
              width: 1.sw,
              decoration: BoxDecoration(
                  color: AppColors.deepGreen,
                  borderRadius: BorderRadius.circular(25.r)),
            )
          ],
        ),
      ),
    );
 */

/*
 Scaffold(
        backgroundColor: AppColors.lightwhite,
        appBar: AppBar(
          backgroundColor: AppColors.lightwhite,
          title: Text(
            "Booking",
            style: AppsFontStyle.titleRobotFontStyle,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Bookings Details",
                        style: AppsFontStyle.titleFontStyle,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const BookingDetailsItem(
                        title: "Package",
                        icon: Symbols.package_2,
                        subTitle: "Sajek Vallery Travel",
                      ),
                      const BookingDetailsItem(
                        title: "Passengers",
                        icon: IconlyLight.user3,
                        subTitle: "2 Adults, 1 Child",
                      ),
                      const BookingDetailsItem(
                        title: "Transport",
                        icon: Symbols.local_shipping,
                        subTitle: "Scania AC Bus (3 Seats)",
                      ),
                      const BookingDetailsItem(
                        title: "Hotel & Resort",
                        icon: Symbols.apartment,
                        subTitle: "5 star Hotel (Deluxe Room)",
                      ),
                      const BookingDetailsItem(
                        title: "Date",
                        icon: Icons.calendar_month,
                        subTitle: "18 Feb - 22 Feb",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Payment Summary",
                        style: AppsFontStyle.titleFontStyle,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      _paymentItem("Regular Price", 40),
                      _paymentItem("Transport Fees", 30),
                      _paymentItem("Hotel and Resort", 25),
                      _paymentItem("Others", 40),
                      Divider(
                        color: AppColors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Grand Total",
                                style: AppsFontStyle.mediumBoldFontStyle),
                            Text(
                              "৳ 135",
                              style: AppsFontStyle.titleFontStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Payment Method",
                        style: AppsFontStyle.titleFontStyle,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 60.h,
                        margin: EdgeInsets.only(bottom: 10.h),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.white),
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.blueColor,
                                        blurRadius: 1)
                                  ],
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppColors.blueColor, width: 1)),
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: AppColors.white),
                                    color: AppColors.blueColor,
                                    shape: BoxShape.circle),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "Master Card",
                              style: AppsFontStyle.mediumBoldFontStyle,
                            ),
                            const Spacer(),
                            Image.asset(
                              ImagesAssets.appLogo,
                              height: 50,
                              width: 50,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        height: 60.h,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.white),
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.blueColor,
                                        blurRadius: 1)
                                  ],
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppColors.blueColor, width: 1)),
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: AppColors.white),
                                    color: AppColors.blueColor,
                                    shape: BoxShape.circle),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "Master Card",
                              style: AppsFontStyle.mediumBoldFontStyle,
                            ),
                            const Spacer(),
                            Image.asset(
                              ImagesAssets.appLogo,
                              height: 50,
                              width: 50,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        height: 60.h,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.white),
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.blueColor,
                                        blurRadius: 1)
                                  ],
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppColors.blueColor, width: 1)),
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: AppColors.white),
                                    color: AppColors.blueColor,
                                    shape: BoxShape.circle),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "Master Card",
                              style: AppsFontStyle.mediumBoldFontStyle,
                            ),
                            const Spacer(),
                            Image.asset(
                              ImagesAssets.appLogo,
                              height: 50,
                              width: 50,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 1.sh,
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: AppColors.deepGreen,
                      borderRadius: BorderRadius.circular(25.r)),
                  child: Center(
                    child: Text(
                      "Pay Now",
                      style: AppsFontStyle.titleFontStyle
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
 */
