import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  final double height;
  final double? width;

  const ShimmerBox({required this.height, super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width ?? 1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
