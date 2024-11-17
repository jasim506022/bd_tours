import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../res/app_colors.dart';
import '../../../res/apps_text_style.dart';
import '../../../res/constant.dart';
import '../../../res/routes/string_constant.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380.h,
      width: 1.sw,
      child: Stack(
        children: [
          Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Bangabhaban.jpg/220px-Bangabhaban.jpg",
            height: 200.h,
            width: 1.sw,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 120.h,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Container(
                  height: 150.h,
                  width: 150.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.black, width: 3),
                      shape: BoxShape.circle),
                  child: ClipOval(
                    child: Image.network(
                      sharedPreference!
                          .getString(AppsString.imagePreferences)!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Column(
                    children: [
                      Text("Md Jasim Uddin",
                          style: AppsFontStyle.titleFontStyle),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "jasim10@gmail.com",
                        style: AppsFontStyle.mediumNormalFontStyle
                            .copyWith(color: AppColors.black.withOpacity(.7)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        if (!await canLaunchUrl(
                          Uri.parse(
                            "https://www.facebook.com/",
                          ),
                        )) {
                          throw Exception(
                              'Could not launch ${"https://www.facebook.com/"}');
                        }
                      },
                      child: Image.asset(
                        "asset/social/facebook.png",
                        height: 45.h,
                        width: 45.h,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (!await launchUrl(
                            Uri.parse("https://www.instagram.com/"))) {
                          throw Exception(
                              'Could not launch ${"https://www.instagram.com/"}');
                        }
                      },
                      child: Image.asset(
                        "asset/social/instagram.png",
                        height: 45.h,
                        width: 45.h,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (!await launchUrl(Uri.parse(
                            "https://www.linkedin.com/home?originalSubdomain=bd"))) {
                          throw Exception(
                              'Could not launch ${"https://www.linkedin.com/home?originalSubdomain=bd"}');
                        }
                      },
                      child: Image.asset(
                        "asset/social/linkedin.png",
                        height: 45.h,
                        width: 45.h,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (!await launchUrl(
                            Uri.parse("whatsapp://send?phone=01980846830"))) {
                          throw Exception(
                              'Could not launch ${"whatsapp://send?phone=01980846830"}');
                        }
                      },
                      child: Image.asset(
                        "asset/social/whatsapp.png",
                        height: 45.h,
                        width: 45.h,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
