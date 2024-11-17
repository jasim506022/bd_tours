import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../res/app_colors.dart';
import '../../res/apps_text_style.dart';
import '../../widget/circular_widget.dart';
import '../travel_agency.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        style: AppsFontStyle.titleFontStyle
                            .copyWith(color: AppColors.blueColor),
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
                      const CardPaymentWidget(
                        title: "VISA",
                        icon: "asset/payment/visa.png",
                      ),
                      const CardPaymentWidget(
                        title: "Master Card",
                        icon: "asset/payment/money.png",
                      ),
                      const CardPaymentWidget(
                        title: "Bkash",
                        icon: "asset/payment/bkash.png",
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
    );
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

class CardPaymentWidget extends StatelessWidget {
  const CardPaymentWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.white,
      color: AppColors.white,
      margin: EdgeInsets.only(bottom: 10.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          children: <Widget>[
            CircularWidget(
              color: AppColors.blueColor,
              size: 40.h,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
              style: AppsFontStyle.mediumBoldFontStyle,
            ),
            const Spacer(),
            Image.asset(
              icon,
              height: 50,
              width: 50,
            )
          ],
        ),
      ),
    );
  }
}
