import 'package:flutter/material.dart';

class CircularIconWithBackgroundWidget extends StatelessWidget {
  const CircularIconWithBackgroundWidget({
    super.key,
    required this.color,
    required this.icon,
    this.size,
    this.padding,
  });

  final Color color;
  final IconData icon;
  final double? size;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(padding ?? 4),
        decoration:
            BoxDecoration(color: color.withOpacity(.1), shape: BoxShape.circle),
        child: Icon(
          icon,
          size: size ?? 15,
          color: color,
        ));
  }
}
