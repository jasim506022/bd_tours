import 'package:bd_tour_firebase/view_model/controller/loading_controller.dart';
import 'package:bd_tour_firebase/widget/custom_button_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../page/widget/button.dart';
import '../res/assets/animation_assets.dart';
import '../res/routes/routes_name.dart';
import '../view_model/controller/profile_controller.dart';
import '../widget/show_error_dialog_widget.dart';
import 'const.dart';
import 'gobalcolor.dart';

class GlobalMethod {
  FutureBuilder<DocumentSnapshot<Map<String, dynamic>>> futureBuildersFunction(
      {required ProfileController editProfileViewModel,
      required Widget widget}) {
    return FutureBuilder(
        future: editProfileViewModel.getCurrentUserDocumentSnapshot(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  globalMethod.errorDialog(
                      animationAssets: AnimationAssets.noErrorAnimation,
                      title: "Error Occurred",
                      content: "${snapshot.error!}");
                },
              );
              return Text("Error : ${snapshot.error}");
            } else if (snapshot.hasData && snapshot.data!.exists) {
              return widget ;
            }
          }

          return const Center(
              child: CircularProgressIndicator(
            color: Colors.black,
          ));
        });
  }

  String monthName(int month) {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "";
    }
  }

  Future<bool> internetChecking() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.none;
  }

  // Email Valid
  bool isValidEmail(String email) {
    String emailRegex = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)*[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(emailRegex);
    return regex.hasMatch(email);
  }

  // Flutter Toast
  flutterToast({required String msg}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.greenColor,
        textColor: AppColors.white,
        fontSize: 16.0);
  }

  // Build Tab
  Tab buildTab({required String title}) {
    return Tab(
      child: SizedBox(
        width: mq.width,
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  errorDialog(
      {required String animationAssets,
      required String title,
      String? content,
      String? buttonText,
      bool? barrierDismissible}) {
    Get.defaultDialog(
        barrierDismissible: barrierDismissible ?? true,
        contentPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        title: "",
        content: Column(
          children: [
            Lottie.asset(
              animationAssets,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                  color: AppColors.deepGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 15,
            ),
            if (content != null)
              Text(
                content!,
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSerif4(fontSize: 16),
              ),
            const SizedBox(
              height: 20,
            ),
            if (buttonText != null)
              CustomRoundButtonWidget(
                buttonColors: AppColors.red,
                width: Get.width,
                title: buttonText,
                onPress: () {
                  Get.back();
                },
              )
          ],
        ));
  }

  emailVerifyCheckAlert({
    required UserCredential userCredential,
    required String animationAssets,
  }) {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        title: "",
        // textConfirm: "continue".tr,

        content: Column(
          children: [
            Lottie.asset(
              animationAssets,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "email_verification_required".tr,
              style: GoogleFonts.poppins(
                  color: AppColors.deepGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "please_verify_your_email".tr,
              textAlign: TextAlign.center,
              style: GoogleFonts.sourceSerif4(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SimpleButtonWidget(
                  onPressed: () {
                    Get.offNamed(RoutesName.userVerifyPage,
                        arguments: userCredential);
                  },
                  title: "continue".tr,
                  color: AppColors.greenColor,
                ),
                // ElevatedButton(onPressed: () {}, child: Text("Continue")),
                SimpleButtonWidget(
                  onPressed: () {
                    Get.back();
                  },
                  title: "No".tr,
                  color: AppColors.red,
                ),
              ],
            )
          ],
        ));
  }

/*
  void emailVerifyCheckAlert(UserCredential userCredential) {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        titleStyle: GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        title: "email_verification_required".tr,
        content: Text(
            "Your email address has not been verified yet. Please verify your email to continue.",
            style: GoogleFonts.poppins(
              color: Colors.black87,

              fontSize: 16,
            )),
        actions: [
          TextButton(
            onPressed: () {
              // Navigator.pushReplacementNamed(context, AppRouters.userVerifyPage,
              //     arguments: userCredential);

              Get.offNamed(RoutesName.userVerifyPage, arguments: userCredential);
            },
            child: Text("continue".tr,
                style: GoogleFonts.poppins(
                  color: AppColors.greenColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
          ),
          TextButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            child: Text("No".tr,
                style: GoogleFonts.poppins(
                  color: AppColors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
          ),
        ]);
  }
*/
  handleError(
    BuildContext context,
    dynamic e,
    LoadingController loadingController,
  ) {
    // Navigator.pop(context);

    String title;
    String message;

    switch (e.code) {
      case 'email-already-in-use':
        title = 'Email Already in Use';
        message = 'Email Already In User. Please Use Another Email';
        break;
      case 'wrong-password':
        title = 'Incorrect password';
        message = 'Password Incorrect. Please Check your Password';
        break;
      case 'invalid-email':
        title = 'Invalid Email Address';
        message = 'Invalid Email address. Please put Valid Email Address';
        break;
      case 'invalid-credential':
        title = 'Check Email or Password';
        message =
            'Invalid email or password. Please check your credentials and try again.';
        break;
      case 'weak-password':
        title = 'Invalid Password';
        message = 'Invalid Password. Please Put Valid Password';
        break;
      case 'too-many-requests':
        title = 'Too Many Requests';
        message = 'Too many requests';
        break;
      case 'operation-not-allowed':
        title = 'Operation Not Allowed';
        message = 'Operation Not Allowed';
        break;
      case 'user-disabled':
        title = 'User Disabled';
        message = 'User Disable';
        break;
      case 'user-not-found':
        title = 'User Not Found';
        message = 'User Not Found';
        break;

      default:
        title = 'Error Occurred';
        message = 'Please check your internet connection or other issues.';
        break;
    }

    showDialog(
      context: context,
      builder: (context) =>
          ShowErrorDialogWidget(title: title, message: message),
    );

    // loadingProvider.setLoading(loading: false);
    loadingController.setLoading(false);
  }

  void showErrorDialog(BuildContext context, String message, String title) {
    showDialog(
      context: context,
      builder: (context) =>
          ShowErrorDialogWidget(message: message, title: title),
    );
  }

  // Rich Text
  RichText buildRichText(
      {required BuildContext context,
      required String simpleText,
      required String colorText,
      required Function function}) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: simpleText,
        style: GoogleFonts.poppins(
            color: AppColors.cardColor, fontWeight: FontWeight.w500),
      ),
      TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              function();
            },
          text: colorText,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                decoration: TextDecoration.underline,
              ),
              color: AppColors.deepGreen,
              fontWeight: FontWeight.w800))
    ]));
  }
}
