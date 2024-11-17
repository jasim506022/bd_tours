
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../const/const.dart';
import 'category_widget.dart';

class ListCategoryWidget extends StatelessWidget {
  const ListCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: travelCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryWidget(category: travelCategories[index]);
        },
      ),
    );
  }
}
