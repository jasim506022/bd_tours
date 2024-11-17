
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClickIconWidget extends StatelessWidget {
  const ClickIconWidget({
    super.key,
    required this.function,
    required this.icon,
  });

  final VoidCallback function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: EdgeInsets.all(6.r),
        decoration:
        const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Icon(
          icon,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}

