import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/gobalcolor.dart';
import '../view_model/controller/loading_controller.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key, required this.onPressed, required this.buttonText});

  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final loadingController = Get.put(LoadingController());
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(10),
          )),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        ),
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        label: Obx(() {
          return loadingController.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: AppColors.white,
                  ),
                )
              : Text(buttonText,
                  style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14));
        }));
  }
}

class SimpleButtonWidget extends StatelessWidget {
  const SimpleButtonWidget(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.color});

  final VoidCallback onPressed;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        ),
        onPressed: onPressed,
        child: Text(title,
            style: GoogleFonts.poppins(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14)));
  }
}
