import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shimmer_box.dart';

class LoadingNearTourWidget extends StatelessWidget {
  const LoadingNearTourWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        height: 230.h,
        width: .65.sw,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            ShimmerBox(
              height: 145.h,
              width: 260.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerBox(height: 15.h),
                  SizedBox(
                    height: 10.h,
                  ),
                  ShimmerBox(height: 15.h),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
