import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSliderWidget extends StatelessWidget {
  const ImageSliderWidget({
    super.key,
    required this.imageList,
  });

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: FlutterCarouselOptions(
        viewportFraction: 1.0,
        height: 0.35.sh,
        showIndicator: true,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        slideIndicator: CircularSlideIndicator(),
      ),
      // Understand This Code
      items: imageList.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return FancyShimmerImage(
              imageUrl: image,
              height: 0.33.sh,
              width: 1.sw,
              boxFit: BoxFit.fill,
            );
          },
        );
      }).toList(),
    );
  }
}