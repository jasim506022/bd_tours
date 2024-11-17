

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../res/apps_text_style.dart';
import '../../../res/assets/image_assets.dart';

class ProjectLogoWidget extends StatelessWidget {
  const ProjectLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ImagesAssets.appLogo,
          height: 70.h,
          width: 70.h,
        ),
         SizedBox(
          height: 10.h,
        ),
        Text(
          "Tour Guides",
          style: AppsFontStyle.appLogoFontStyle,
        ),
      ],
    );
  }
}
