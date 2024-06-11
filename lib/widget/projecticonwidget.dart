import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectIconWidget extends StatelessWidget {
  const ProjectIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "asset/image/logo.png",
          height: 70,
          width: 70,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Tour Guides",
          style: GoogleFonts.pacifico(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
