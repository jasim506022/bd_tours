import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../res/apps_function.dart';

class ShowImageListPage extends StatelessWidget {
  const ShowImageListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppsFunction.statusBarIcon();

    List<String> imageList = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Show Image",
        ),
      ),
      body: Center(
        child: FanCarouselImageSlider.sliderType2(
          imagesLink: imageList,
          isAssets: false,
          autoPlay: false,
          expandedImageFitMode: BoxFit.contain,
          sliderHeight: 0.4.sh,
          currentItemShadow: const [],
          sliderDuration: const Duration(milliseconds: 200),
          imageRadius: 15,
          sliderWidth: 1.sw,
          imageFitMode: BoxFit.fill,
          slideViewportFraction: 1,
        ),
      ),
    );
  }
}
