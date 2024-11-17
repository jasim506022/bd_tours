import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import '../../../../const/const.dart';

import '../../../../model/tour_model.dart';

import 'widget/comment_box_widget.dart';
import 'widget/review_list_widget.dart';

class TourReviewsWidget extends StatelessWidget {
  const TourReviewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tourModel = Provider.of<TourModel>(context, listen: false);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus;
      },
      child: IndexedStack(
        index: 0,
        children: [
          SizedBox(
            height: 0.555.sh,
            width: mq.width,
            child: Column(
              children: [
                Expanded(
                  flex: 16,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CommentsBoxWidget(
                            tourModel: tourModel,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListCommentsWidget(tourModel: tourModel)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
