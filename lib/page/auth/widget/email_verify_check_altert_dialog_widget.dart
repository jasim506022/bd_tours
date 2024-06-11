import 'package:bd_tour_firebase/res/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../const/gobalcolor.dart';

class EmailVerifyCheckAlertDialogWidget extends StatelessWidget {
  const EmailVerifyCheckAlertDialogWidget({
    super.key,
    required this.userCredential,
  });

  final UserCredential userCredential;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(15),
      title: Column(
        children: [
          Lottie.asset(
            "asset/lottie/unverified.json",
            height: 100,
            width: 100,
          ),
          Text(
            "Email Hello Verification Required",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      content: Text(
          "Your email address has not been verified yet. Please verify your email to continue.",
          style: GoogleFonts.poppins(
            color: Colors.black87,
            // fontWeight: FontWeight.bold,
            fontSize: 16,
          )),
      actions: [
        TextButton(
          onPressed: () {
            // Navigator.pushReplacementNamed(context, AppRouters.userVerifyPage,
            //     arguments: userCredential);

            Get.offNamed(RoutesName.userVerifyPage);
          },
          child: Text("continue",
              style: GoogleFonts.poppins(
                color: AppColors.greenColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("No",
              style: GoogleFonts.poppins(
                color: AppColors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
        ),
      ],
    );
  }
}
