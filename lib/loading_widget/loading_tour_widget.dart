
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/app_colors.dart';
import 'shimmer_box.dart';
import 'shimmer_circle.dart';

class LoadingTourWidget extends StatelessWidget {
  const LoadingTourWidget({
    super.key,
    // required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: const EdgeInsets.symmetric(vertical: 7),
      height: 120.h,
      width: 1.sw,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(15.r)),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ShimmerBox(
                  height: 100.h,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShimmerBox(
                      height: 13.h,
                      width: 0.45.sw,
                    ),
                    Row(
                      children: [
                        ShimmerBox(
                          height: 20.h,
                          width: 20,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        ShimmerBox(
                          height: 12.h,
                          width: .4.sw,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < 3; i++)
                          const Align(
                              widthFactor: .7,
                              child: ShimmerCircle(height: 20)),
                        SizedBox(
                          width: 10.w,
                        ),
                        ShimmerBox(
                          height: 12.h,
                          width: .3.sw,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const Positioned(
              right: 0,
              child: ShimmerCircle(
                height: 50,
              ))
        ],
      ),
    );
  }
}
