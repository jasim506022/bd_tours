import 'package:bd_tour_firebase/res/apps_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../../res/app_colors.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
    required this.title,
    required this.function,
  });

  final String title;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppsFontStyle.titleFontStyle,
        ),
        TextButton(
            onPressed: () {
              function();
            },
            child: Text("See All",
                style: AppsFontStyle.mediumBoldFontStyle
                    .copyWith(color: AppColors.blueColor)))
      ],
    );
  }
}
