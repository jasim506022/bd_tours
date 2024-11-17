import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shimmer_box.dart';

class LoadingUserProfileShimmerWidget extends StatelessWidget {
  const LoadingUserProfileShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 1.sw,
      child: Row(
        children: [
          ShimmerBox(
            height: 40.w,
            width: 40.w,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShimmerBox(
                  height: 10.h,
                ),
                ShimmerBox(
                  height: 10.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
