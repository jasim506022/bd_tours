import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../const/gobalcolor.dart';

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
          style: GoogleFonts.poppins(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        TextButton(
            onPressed: () {
              function();
            },
            child: Text(
              "See All",
              style: GoogleFonts.poppins(
                  color: AppColors.blueColor, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
