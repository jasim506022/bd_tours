import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/apps_text_style.dart';
import 'circular_icon_width_background_widget.dart';

class LabeledIconWithBackgroundWidget extends StatelessWidget {
  const LabeledIconWithBackgroundWidget({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    this.textColor,
  });

  final Color color;
  final IconData icon;
  final String title;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularIconWithBackgroundWidget(color: color, icon: icon),
        SizedBox(
          width: 5.w,
        ),
        Text(
          title,
          style: textColor == null
              ? AppsFontStyle.smallFontStyle
              : AppsFontStyle.smallFontStyle.copyWith(color: textColor),
        ),
      ],
    );
  }
}
