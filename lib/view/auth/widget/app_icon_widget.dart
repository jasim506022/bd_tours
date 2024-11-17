import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../const/const.dart';
import '../../../res/app_colors.dart';


class AppIconWidget extends StatefulWidget {
  const AppIconWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<AppIconWidget> createState() => _AppIconWidgetState();
}

class _AppIconWidgetState extends State<AppIconWidget>
    with TickerProviderStateMixin {
  bool isSelect = false;

  @override
  void initState() {
    // TODO: implement initState
    Timer(
      const Duration(seconds: 1),
      () {
        isSelect = true;
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          "asset/lottie/logo_tour.json",
          // "asset/lottie/unverified.json"
          height: mq.height * .2,
          width: mq.height * .2,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 10,
        ),
        AnimatedAlign(
          alignment: isSelect ? Alignment.center : Alignment.centerLeft,
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
          child: Text(widget.title,
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(
          height: 5,
        ),
        AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: isSelect ? 1.0 : 0.0,
          child: Text(
            "Tour Guide Apps",
            style: GoogleFonts.pacifico(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
