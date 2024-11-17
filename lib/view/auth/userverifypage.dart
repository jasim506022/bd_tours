import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/const.dart';

import '../../res/app_colors.dart';
import '../../res/routes/routes_name.dart';
import '../../service/database/firebase_database_provider.dart';
import '../../controller/verify_page_controller.dart';

/// Widget for handling user email verification.
class UserVerifyPage extends StatelessWidget {
  const UserVerifyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final VerifyPageController controller = Get.put(VerifyPageController());
    return PopScope(
      onPopInvoked: (didPop) {
        Get.offNamed(RoutesName.loginPage);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Verify Email",
            style: GoogleFonts.stixTwoText(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    "A Verification Mail has been sent to your email for email verification",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                  width: mq.width,

                  // Use reSend Email
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: mq.width * 0.022,
                          vertical: mq.height * 0.018),
                    ),
                    icon: Icon(Icons.email, size: 32, color: AppColors.white),
                    label: Text("Resent Email",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      if (controller.canResendEmail.value) {
                        controller.sendVerificationEmail();
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: mq.width,
                  // Use
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                              color: AppColors.greenColor, width: 2)),
                      padding: EdgeInsets.symmetric(
                          horizontal: mq.width * 0.022,
                          vertical: mq.height * 0.018),
                    ),
                    child: Text("Cancel",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        controller.cancel();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/const.dart';
import '../../const/gobalcolor.dart';
import '../../res/routes/routes_name.dart';
import '../../service/database/firebase_database_provider.dart';

/// Widget for handling user email verification.
class UserVerifyPage extends StatefulWidget {
  const UserVerifyPage({
    super.key,
  });

  @override
  State<UserVerifyPage> createState() => _UserVerifyPageState();
}

class _UserVerifyPageState extends State<UserVerifyPage> {

  bool _isEmailVerified = false;
  bool _canResendEmail = false;

  late UserCredential _userCredential;

  late Timer _timer;

  @override
  void initState() {

    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      setState(() {
        _checkEmailVerification();
        if (_isEmailVerified) {
          Get.offNamed(RoutesName.loginPage);
        }
      });
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userCredential = Get.arguments as UserCredential;

    if (FirebaseAuth.instance.currentUser != null) {
      _isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      if (!_isEmailVerified) {
        _sendVerificationEmail();
        _checkEmailVerification();
      }
    }
    // _isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    // if (!_isEmailVerified) {
    //   _sendVerificationEmail();
    //   _checkEmailVerification();
    // }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  _uploadData() async {
    await FirebaseServiceProvider.createUserByEmailPassword(
        status: _isEmailVerified ? "approved" : "not_approved",
        userCredential: _userCredential);
  }

  Future _checkEmailVerification() async {
    await FirebaseAuth.instance.currentUser!.reload();
    if (mounted) {
      setState(() =>
          _isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified);
    }
    if (_isEmailVerified) {
      _uploadData();
      _timer.cancel();

      if (mounted) {
        // Navigator.pushReplacementNamed(context, AppRouters.loginPage);
        Get.offNamed(RoutesName.loginPage);
      }
    }
  }

  Future _sendVerificationEmail() async {
    await _userCredential.user!.sendEmailVerification();
    setState(() => _canResendEmail = false);
    await Future.delayed(const Duration(seconds: 3));
    setState(() => _canResendEmail = true);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        // Navigator.pushReplacementNamed(context, AppRouters.loginPage);
        Get.offNamed(RoutesName.loginPage);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Verify Email",
            style: GoogleFonts.stixTwoText(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    "A Verification Mail has been sent to your email for email verification",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                  width: mq.width,

                  // Use reSend Email
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: mq.width * 0.022,
                          vertical: mq.height * 0.018),
                    ),
                    icon: Icon(Icons.email, size: 32, color: AppColors.white),
                    label: Text("Resent Email",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold)),
                    onPressed: _canResendEmail ? _sendVerificationEmail : null,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: mq.width,
                  // Use
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                              color: AppColors.greenColor, width: 2)),
                      padding: EdgeInsets.symmetric(
                          horizontal: mq.width * 0.022,
                          vertical: mq.height * 0.018),
                    ),
                    child: Text("Cancel",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        _uploadData();
                        _timer.cancel();
                        // Navigator.pushReplacementNamed(
                        //     context, AppRouters.loginPage);
                        Get.offNamed(RoutesName.loginPage);
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

 */
