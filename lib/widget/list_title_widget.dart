import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/gobalcolor.dart';

class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.function,
  });
  final IconData icon;
  final String title;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              icon,
              size: 30,
              color: AppColors.blueColor,
            ),
            title: Text(
              title,
              style: GoogleFonts.dmSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            trailing: IconButton(
                onPressed: function,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.blueColor,
                )),
          ),
        ],
      ),
    );
  }
}
